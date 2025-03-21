#xcodebuild -create-xcframework -archive "./archives/SciendisHealthCardKit.xcarchive" -library /Users/priskakohnen/Library/Developer/Xcode/DerivedData/OpenHealthCardKit-ahpfzjgiwnykfbfydabudiqqdkkv/Build/Products/Debug-iphoneos/libSciendisHealthCardKit_static.a -headers /Users/priskakohnen/Library/Developer/Xcode/DerivedData/OpenHealthCardKit-ahpfzjgiwnykfbfydabudiqqdkkv/Build/Products/Debug-iphoneos/SciendesHealthCardKit.swiftmodule -output xcframeworks/SciendisHealthCardKit.xcframework

#xcodebuild -create-xcframework -archive "./archives/SciendisHealthCardKit.xcarchive" -library /Users/priskakohnen/Library/Developer/Xcode/DerivedData/OpenHealthCardKit-ahpfzjgiwnykfbfydabudiqqdkkv/Build/Products/Debug-iphoneos/libSciendisHealthCardKit_static.a -output xcframeworks/SciendisHealthCardKit.xcframework

#xcodebuild -create-xcframework 
#-archive "./archives/SciendisHealthCardKitFramework.xcarchive" 
#-framework /Users/priskakohnen/Library/Developer/Xcode/DerivedData/OpenHealthCardKit-ahpfzjgiwnykfbfydabudiqqdkkv/Build/Products/Debug-iphoneos/SciendisHealthCardKit.framework  
#-output xcframeworks/SciendisHealthCardKitFramework.xcframework


# xcodebuild clean -project OpenHealthCardKit.xcodeproj 

xcodebuild \
-project OpenHealthCardKit.xcodeproj \
-scheme "Helper_iOS" \
-destination generic/platform=iOS BUILD_LIBRARY_FOR_DISTRIBUTION=YES MACH_O_TYPE=staticlib -derivedDataPath build
#-archivePath "archives/Helper_iOS" SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES MACH_O_TYPE=staticlib

xcodebuild \
-project OpenHealthCardKit.xcodeproj \
-scheme "CardReaderProviderApi_iOS" \
-destination generic/platform=iOS BUILD_LIBRARY_FOR_DISTRIBUTION=YES MACH_O_TYPE=staticlib -derivedDataPath build
#-archivePath "archives/CardReaderProviderApi_iOS" SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES MACH_O_TYPE=staticlib

xcodebuild \
-project OpenHealthCardKit.xcodeproj \
-scheme "CardReaderAccess_iOS" \
-destination generic/platform=iOS BUILD_LIBRARY_FOR_DISTRIBUTION=YES MACH_O_TYPE=staticlib -derivedDataPath build
# -archivePath "archives/CardReaderAccess_iOS" SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES MACH_O_TYPE=staticlib

xcodebuild \
-project OpenHealthCardKit.xcodeproj \
-scheme "HealthCardAccess_iOS" \
-destination generic/platform=iOS BUILD_LIBRARY_FOR_DISTRIBUTION=YES MACH_O_TYPE=staticlib -derivedDataPath build
# -archivePath "archives/HealthCardAccess_iOS" SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES MACH_O_TYPE=staticlib

xcodebuild \
-project OpenHealthCardKit.xcodeproj \
-scheme "HealthCardControl_iOS" \
-destination generic/platform=iOS BUILD_LIBRARY_FOR_DISTRIBUTION=YES MACH_O_TYPE=staticlib -derivedDataPath build
# -archivePath "archives/HealthCardControl_iOS" SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES MACH_O_TYPE=staticlib

xcodebuild \
-project OpenHealthCardKit.xcodeproj \
-scheme "NFCCardReaderProvider" \
-destination generic/platform=iOS BUILD_LIBRARY_FOR_DISTRIBUTION=YES MACH_O_TYPE=staticlib -derivedDataPath build
# -archivePath "archives/NFCCardReaderProvider" SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES MACH_O_TYPE=staticlib

# export BUILD_PRODUCTS_DIR=$(xcodebuild -scheme "Helper_iOS" -configuration Debug  -showBuildSettings | grep BUILD_PRODUCTS_DIR | awk '{print $3}')
# echo $BUILD_PRODUCTS_DIR

xcodebuild -create-xcframework \
-framework build/Build/Products/Debug-iphoneos/Helper.framework \
-output xcframeworks2/Helper.xcframework
# -archive "./archives/Helper_iOS.xcarchive" \

xcodebuild -create-xcframework \
-framework build/Build/Products/Debug-iphoneos/CardReaderProviderApi.framework \
-output xcframeworks2/CardReaderProviderApi.xcframework
# -archive "./archives/CardReaderProviderApi_iOS.xcarchive" \

xcodebuild -create-xcframework \
-framework build/Build/Products/Debug-iphoneos/CardReaderAccess.framework  \
-output xcframeworks2/CardReaderAccess.xcframework
# -archive "./archives/CardReaderAccess_iOS.xcarchive" \

xcodebuild -create-xcframework \
-framework build/Build/Products/Debug-iphoneos/HealthCardAccess.framework  \
-output xcframeworks2/HealthCardAccess.xcframework
# -archive "./archives/HealthCardAccess_iOS.xcarchive" \

xcodebuild -create-xcframework \
-framework build/Build/Products/Debug-iphoneos/HealthCardControl.framework  \
-output xcframeworks2/HealthCardControl.xcframework
# -archive "./archives/HealthCardControl_iOS.xcarchive" \

xcodebuild -create-xcframework \
-framework build/Build/Products/Debug-iphoneos/NFCCardReaderProvider.framework  \
-output xcframeworks2/NFCCardReaderProvider.xcframework
# -archive "./archives/NFCCardReaderProvider.xcarchive" \
