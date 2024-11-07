load("//bazel/rules/cc:cc_firmware.bzl", "cc_firmware")

COMPATIBILITY = [
    "//bazel/platforms/cpu:avr",
    "@platforms//os:none",
]

cc_library(
    name = "delay",
    srcs = ["delay.cpp"],
    hdrs = ["delay.h"],
    local_defines = ["F_CPU=16000000UL"],
    target_compatible_with = COMPATIBILITY,
)

cc_binary(
    name = "blink",
    srcs = [
        "blink.cpp",
    ],
    target_compatible_with = COMPATIBILITY,
    deps = [":delay"],
)

cc_firmware(
    name = "blink_firmware",
    src = ":blink",
    target_compatible_with = COMPATIBILITY,
)
