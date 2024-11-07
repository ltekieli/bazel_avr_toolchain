load(":cc_toolchain_config.bzl", "cc_toolchain_config")

package(default_visibility = ["//visibility:public"])

filegroup(name = "empty")

filegroup(
    name = "wrappers",
    srcs = glob([
        "wrappers/**",
    ]),
)

filegroup(
    name = "all_files",
    srcs = [
        "@avr//:toolchain",
    ],
)

cc_toolchain_config(
    name = "avr_toolchain_config",
    binary_ar = "@avr//:binary_ar",
    binary_gcc = "@avr//:binary_gcc",
    binary_objcopy = "@avr//:binary_objcopy",
    binary_strip = "@avr//:binary_strip",
)

cc_toolchain(
    name = "avr_toolchain",
    all_files = ":all_files",
    ar_files = ":all_files",
    compiler_files = ":all_files",
    dwp_files = ":empty",
    linker_files = ":all_files",
    objcopy_files = ":all_files",
    strip_files = ":all_files",
    toolchain_config = ":avr_toolchain_config",
    toolchain_identifier = "avr-toolchain",
)

toolchain(
    name = "avr_none_toolchain",
    exec_compatible_with = [
        "@platforms//os:linux",
        "@platforms//cpu:x86_64",
    ],
    target_compatible_with = [
        "@platforms//os:none",
        "//bazel/platforms/cpu:avr",
    ],
    toolchain = ":avr_toolchain",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
)
