// swift-tools-version:6.3
import PackageDescription

let package = Package(
  name: "elementary-web-app",
  platforms: [.macOS(.v26)],
  dependencies: [
    .package(url: "https://github.com/elementary-swift/elementary-ui.git", from: "0.5.0")
  ],
  targets: [
    .executableTarget(
      name: "WebApp",
      dependencies: [
        .product(name: "ElementaryUI", package: "elementary-ui")
      ],
      swiftSettings: [
        .swiftLanguageMode(.v5)
      ],
      linkerSettings: [
        .unsafeFlags(
          ["-Xlinker", "-z", "-Xlinker", "stack-size=8388608"],
          .when(configuration: .debug),
        )
      ],
    )
  ],
)
