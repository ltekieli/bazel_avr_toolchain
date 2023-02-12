def register_all_toolchains():
    native.register_toolchains(
        "//bazel/toolchain/avr:avr_none_toolchain",
    )
