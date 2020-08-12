workspace(name = "bazel_parallelism_test")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "bazel_toolchains",
    sha256 = "7ebb200ed3ca3d1f7505659c7dfed01c4b5cb04c3a6f34140726fe22f5d35e86",
    strip_prefix = "bazel-toolchains-3.4.1",
    urls = [
        "https://github.com/bazelbuild/bazel-toolchains/releases/download/3.4.1/bazel-toolchains-3.4.1.tar.gz",
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-toolchains/releases/download/3.4.1/bazel-toolchains-3.4.1.tar.gz",
    ],
)

load("@bazel_toolchains//rules:rbe_repo.bzl", "rbe_autoconfig")

rbe_autoconfig(
    name = "rbe_default",
)
