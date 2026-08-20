import Foundation
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ColorResource {

    /// The "AccentColor" asset catalog color resource.
    static let accent = DeveloperToolsSupport.ColorResource(name: "AccentColor", bundle: resourceBundle)

}

// MARK: - Image Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ImageResource {

    /// The "losangeles" asset catalog image resource.
    static let losangeles = DeveloperToolsSupport.ImageResource(name: "losangeles", bundle: resourceBundle)

    /// The "miami" asset catalog image resource.
    static let miami = DeveloperToolsSupport.ImageResource(name: "miami", bundle: resourceBundle)

    /// The "newyork" asset catalog image resource.
    static let newyork = DeveloperToolsSupport.ImageResource(name: "newyork", bundle: resourceBundle)

}

