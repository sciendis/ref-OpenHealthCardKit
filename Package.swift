// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "Openhealthcardkit",
    platforms: [
        .iOS(.v14),
        .macOS(.v12)
    ],
    products: [
        .library(
            name:"SciendisHealthCardKit",
            type: .static,
            targets: ["SciendisHealthCardKit_static"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/gematik/ASN1Kit.git", from: "1.2.0"),
        .package(url: "https://github.com/gematik/OpenSSL-Swift", from: "4.2.0"),
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.3.0"),
    ],
    targets: [
        .target(
            name: "SciendisHealthCardKit_static",
            dependencies: [
                "NFCCardReaderProvider_static",
                "HealthCardControl_static",
                "HealthCardAccess_static",
                "CardReaderAccess_static",
                "CardReaderProviderApi_static",
                "Helper_static"
            ],
            path: "Sources/SciendisHealthCardKit"
         
        ),
        .target(
            name: "NFCCardReaderProvider_static",
            dependencies: [
                "HealthCardControl_static",
            ],
            path: "Sources/NFCCardReaderProvider"
        ),
        .target(
            name: "HealthCardControl_static",
            dependencies: [
                "HealthCardAccess_static",
                "OpenSSL-Swift"
            ],
            path: "Sources/HealthCardControl"
        ),
        .target(
            name: "HealthCardAccess_static",
            dependencies: ["CardReaderAccess_static", "ASN1Kit"],
            path: "Sources/HealthCardAccess"
        ),
        .target(
            name: "CardReaderAccess_static",
            dependencies: ["CardReaderProviderApi_static"],
            path: "Sources/CardReaderAccess"
        ),
        .target(
            name: "CardReaderProviderApi_static",
            dependencies: ["Helper_static"],
            path: "Sources/CardReaderProviderApi"
        ),
        .target(
            name: "Helper_static",
            path: "Sources/Helper"
        ),

    ]
)
