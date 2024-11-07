load("@bazel_tools//tools/build_defs/cc:action_names.bzl", "ACTION_NAMES")
load("@bazel_tools//tools/cpp:toolchain_utils.bzl", "find_cpp_toolchain", "use_cpp_toolchain")

def _impl(ctx):
    src = ctx.attr.src.files.to_list()[0]
    binary = ctx.actions.declare_file(ctx.label.name + ".hex")
    toolchain = find_cpp_toolchain(ctx)

    args = ctx.actions.args()
    args.add("-O", "ihex")
    args.add(src)
    args.add(binary)

    feature_configuration = cc_common.configure_features(
        ctx = ctx,
        cc_toolchain = toolchain,
        requested_features = ctx.features,
        unsupported_features = ctx.disabled_features,
    )

    objcopy = cc_common.get_tool_for_action(feature_configuration = feature_configuration, action_name = ACTION_NAMES.objcopy_embed_data)

    ctx.actions.run(
        executable = objcopy,
        outputs = [binary],
        inputs = depset(
            direct = [src],
            transitive = [toolchain.all_files],
        ),
        arguments = [args],
        mnemonic = "Firmware",
        use_default_shell_env = True,
    )

    return [
        DefaultInfo(
            files = depset([binary]),
        ),
    ]

cc_firmware = rule(
    implementation = _impl,
    attrs = {
        "src": attr.label(allow_single_file = True),
    },
    fragments = ["cpp"],
    toolchains = use_cpp_toolchain(),
)
