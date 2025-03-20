// swift-tools-version: 5.8


import PackageDescription

let package = Package(
    name: "Openhealthcardkit",
    platforms: [
        .iOS(.v14),
        .macOS(.v12)
    ],
    products: [
        //.library(
         //   name:"SciendisHealthCardKit",
           // type: .static,
            //targets: ["SciendisHealthCardKit_static"]
        //),
      //  .library(
      //      name:"SciendisHealthCardKitFramework",
      //      targets: ["SciendisHealthCardKitFramework"]
      //  ),
        .library(
            name:"Helper",
            targets: ["Helper"]
        ),
        .library(
            name:"CardReaderProviderApi",
            targets: ["CardReaderProviderApi"]
        ),
        .library(
            name:"CardReaderAccess",
            targets: ["CardReaderAccess"]
        ),
        .library(
            name:"HealthCardAccess",
            targets: ["HealthCardAccess"]
        ),
        .library(
            name:"HealthCardControl",
            targets: ["HealthCardControl"]
        ),
        .library(
            name:"NFCCardReaderProvider",
            targets: ["NFCCardReaderProvider"]
        ),
        .library(name:"ASN1Kit", targets:["ASN1KitWrapper"]),
        .library(name:"OpenSSL", targets:["OpenSSLWrapper"])
    ],
    dependencies: [
        .package(url: "https://github.com/gematik/ASN1Kit.git", from: "1.2.0"),
        .package(url: "https://github.com/gematik/OpenSSL-Swift", from: "4.2.0"),
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.3.0"),
    ],
    targets: [
        .binaryTarget(
            name: "Helper",
            path: "xcframeworks2/Helper.xcframework"
        ),
        .binaryTarget(
            name: "CardReaderProviderApi",
            path: "xcframeworks2/CardReaderProviderApi.xcframework"
        ),
        .binaryTarget(
            name: "CardReaderAccess",
            path: "xcframeworks2/CardReaderAccess.xcframework"
        ),
        .binaryTarget(
            name: "HealthCardAccess",
            path: "xcframeworks2/HealthCardAccess.xcframework"
        ),
        .binaryTarget(
            name: "HealthCardControl",
            path: "xcframeworks2/HealthCardControl.xcframework"
        ),
        .binaryTarget(
            name: "NFCCardReaderProvider",
            path: "xcframeworks2/NFCCardReaderProvider.xcframework"
        ),
        //.binaryTarget(
         //   name: "SciendisHealthCardKitFramework",
        //    path: "xcframeworks/SciendisHealthCardKitFramework.xcframework"
        //),
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
        .target(
            name: "ASN1KitWrapper",
            dependencies: ["ASN1Kit"] ,// Reference the dependency here
            path: "Sources/ASN1KitWrapper"
        ),
        .target(
            name: "OpenSSLWrapper",
            dependencies: ["OpenSSL-Swift"]  ,// Reference the dependency here
            path: "Sources/OpenSSLWrapper"
        )
    ]
)
