load("@bazel_tools//tools/cpp:toolchain_utils.bzl", "find_cpp_toolchain", "use_cpp_toolchain")

def _impl(ctx):
    src = ctx.attr.src.files.to_list()[0]
    binary = ctx.actions.declare_file(ctx.label.name + ".hex")
    toolchain = find_cpp_toolchain(ctx)

    args = ctx.actions.args()
    args.add("-O", "ihex")
    args.add(src)
    args.add(binary)

    ctx.actions.run(
        executable = toolchain.objcopy_executable,
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
    toolchains = use_cpp_toolchain(),
)
