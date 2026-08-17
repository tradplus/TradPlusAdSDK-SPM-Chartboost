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
            .exact("15.13.0")
        ),
        .package(
            url: "https://github.com/ChartBoost/chartboost-monetization-ios-sdk.git",
            .exact("9.13.0")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Chartboost/releases/download/15.13.0/TPChartboostAdapter-15.13.0.xcframework.zip",
            checksum: "9b7d94050984c0817d4091fd59bb5c000023891c1b6ce92ef474fb1f2d9fd5b2"
        ),
    ]
)
