load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

URL_TOOLCHAIN = "https://github.com/ltekieli/devboards-toolchains/releases/download/v2023.04.01/"

def toolchains():
    if "avr" not in native.existing_rules():
        http_archive(
            name = "avr",
            build_file = Label("//third_party/toolchains:avr.BUILD"),
            url = URL_TOOLCHAIN + "avr.tar.gz",
            sha256 = "04023fb121f94f858dc664d8fa46ddcb605acbb7e6d1b0f41123a7c94994580a",
        )
