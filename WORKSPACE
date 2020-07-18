workspace(name = "bazel_parallelism_test")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Go rules.
http_archive(
    name = "io_bazel_rules_go",
    sha256 = "e5de048e72612598c45f564202f6a3c74616be4ffd2dbd6f7bc75045f8ecbdce",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.23.4/rules_go-v0.23.4.tar.gz",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.23.4/rules_go-v0.23.4.tar.gz",
    ],
)

# Gazelle.
http_archive(
    name = "bazel_gazelle",
    sha256 = "41bff2a0b32b02f20c227d234aa25ef3783998e5453f7eade929704dcff7cd4b",
    urls = ["https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.19.0/bazel-gazelle-v0.19.0.tar.gz"],
)

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies", "go_repository")
load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains()

gazelle_dependencies()

# Needed for protobuf.
http_archive(
    name = "com_google_protobuf",
    sha256 = "678d91d8a939a1ef9cb268e1f20c14cd55e40361dc397bb5881e4e1e532679b1",
    strip_prefix = "protobuf-3.10.1",
    urls = ["https://github.com/protocolbuffers/protobuf/archive/v3.10.1.zip"],
)

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()

go_repository(
    name = "com_github_bazelbuild_remote_apis_sdks",
    commit = "f9b4b0d53c0ee1ad5b56a4721058471ce39e0d9f",
    importpath = "github.com/bazelbuild/remote-apis-sdks",
)

load("@com_github_bazelbuild_remote_apis_sdks//:remote-apis-sdks-deps.bzl", "remote_apis_sdks_go_deps")

remote_apis_sdks_go_deps()

load("@com_github_bazelbuild_remote_apis//:repository_rules.bzl", "switched_rules_by_language")

switched_rules_by_language(
    name = "bazel_remote_apis_imports",
    go = True,
)

http_archive(
    name = "bazel_toolchains",
    sha256 = "db48eed61552e25d36fe051a65d2a329cc0fb08442627e8f13960c5ab087a44e",
    strip_prefix = "bazel-toolchains-3.2.0",
    urls = [
        "https://github.com/bazelbuild/bazel-toolchains/releases/download/3.2.0/bazel-toolchains-3.2.0.tar.gz",
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-toolchains/releases/download/3.2.0/bazel-toolchains-3.2.0.tar.gz",
    ],
)

load("@bazel_toolchains//rules:rbe_repo.bzl", "rbe_autoconfig")

rbe_autoconfig(
    name = "rbe_default",

    # configure RBE platform images
    # https://cloud.google.com/remote-build-execution/docs/create-custom-toolchain
    # _LATEST of bazel-toolchains/configs/ubuntu16_04_clang/versions.bzl
    base_container_digest = "sha256:5e750dd878df9fcf4e185c6f52b9826090f6e532b097f286913a428290622332",
    digest = "sha256:53e6a9d34472dd76ed016f63f9c12fc5cd072b802fa2e6dc08f09ccefb467340",
    # gcr.io/foundry-x-build/re-client-builder:v2
    registry = "gcr.io",
    repository = "foundry-x-build/re-client-builder",
    use_checked_in_confs = "Force",
)

go_repository(
    name = "org_golang_google_protobuf",
    importpath = "google.golang.org/protobuf",
    sum = "h1:UhZDfRO8JRQru4/+LlLE0BRKGF8L+PICnvYZmx/fEGA=",
    version = "v1.24.0",
)
