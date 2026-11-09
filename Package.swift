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
            .exact("15.18.0")
        ),
        .package(
            url: "https://github.com/ChartBoost/chartboost-monetization-ios-sdk.git",
            .exact("9.14.2")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Chartboost/releases/download/15.18.0/TPChartboostAdapter-15.18.0.xcframework.zip",
            checksum: "7211612524c369c7edaf7e8294c8d2044a6bbdc6247a9d35db86dfc0da3ebe24"
        ),
    ]
)
