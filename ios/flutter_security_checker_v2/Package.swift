// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "flutter_security_checker_v2",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(name: "flutter-security-checker-v2", targets: ["flutter_security_checker_v2"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "flutter_security_checker_v2",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework")
            ]
        )
    ]
)
