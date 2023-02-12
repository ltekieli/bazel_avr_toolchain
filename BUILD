load("//bazel/rules/cc:cc_firmware.bzl", "cc_firmware")

cc_library(
    name = "delay",
    srcs = ["delay.cpp"],
    hdrs = ["delay.h"],
    local_defines = ["F_CPU=16000000UL"],
)

cc_binary(
    name = "blink",
    srcs = [
        "blink.cpp",
    ],
    deps = [":delay"],
)

cc_firmware(
    name = "blink_firmware",
    src = ":blink",
)
