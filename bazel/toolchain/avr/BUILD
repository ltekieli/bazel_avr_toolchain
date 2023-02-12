package(default_visibility = ["//visibility:public"])

load(":cc_toolchain_config.bzl", "cc_toolchain_config")

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
        ":wrappers",
        "@avr//:toolchain",
    ],
)

cc_toolchain_config(name = "avr_toolchain_config")

cc_toolchain(
    name = "avr_toolchain",
    all_files = ":all_files",
    ar_files = ":all_files",
    compiler_files = ":all_files",
    dwp_files = ":empty",
    linker_files = ":all_files",
    objcopy_files = ":all_files",
    strip_files = ":empty",
    toolchain_config = ":avr_toolchain_config",
    toolchain_identifier = "avr-toolchain",
)

cc_toolchain_suite(
    name = "gcc_toolchain",
    tags = ["manual"],
    toolchains = {
        "avr": ":avr_toolchain",
    },
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
