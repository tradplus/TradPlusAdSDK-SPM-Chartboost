// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TradPlusChartboostAdapter",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "TradPlusChartboostAdapter",
            targets: ["TradPlusChartboostAdapter"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM.git",
            .exact("15.15.0")
        ),
        .package(
            url: "https://github.com/ChartBoost/chartboost-monetization-ios-sdk.git",
            .exact("9.14.0")
        ),
    ],
    targets: [
        .target(
            name: "TradPlusChartboostAdapter",
            dependencies: [
                .target(name: "TPChartboostAdapter"),
                .product(name: "TradPlusAdSDK", package: "TradPlusAdSDK-SPM"),
                .product(name: "ChartboostSDK", package: "chartboost-monetization-ios-sdk"),
            ],
            path: ".",
            sources: ["Sources/TradPlusChartboostAdapter/TradPlusChartboostAdapter.swift"]
        ),
        .binaryTarget(
            name: "TPChartboostAdapter",
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Chartboost/releases/download/15.15.0/TPChartboostAdapter-15.15.0.xcframework.zip",
            checksum: "695b0ce2c20ef59699570a85bac8dece4c84d3d12b0de8e1c67671cf5a128041"
        ),
    ]
)
