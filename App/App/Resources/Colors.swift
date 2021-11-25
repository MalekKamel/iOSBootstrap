// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
public typealias AssetColorTypeAlias = ColorAsset.Color

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum Colors {
  public static let blueGray = ColorAsset(name: "blueGray")
  public static let brownishGrey = ColorAsset(name: "brownishGrey")
  public static let centerBlue = ColorAsset(name: "centerBlue")
  public static let cloudBlue = ColorAsset(name: "cloudBlue")
  public static let cloudyBlueTwo = ColorAsset(name: "cloudyBlueTwo")
  public static let darkIndigo = ColorAsset(name: "darkIndigo")
  public static let darkRed = ColorAsset(name: "darkRed")
  public static let darkRed2 = ColorAsset(name: "darkRed2")
  public static let darkRed3 = ColorAsset(name: "darkRed3")
  public static let darkRed4 = ColorAsset(name: "darkRed4")
  public static let dodgerBlue = ColorAsset(name: "dodgerBlue")
  public static let fadedBlue = ColorAsset(name: "fadedBlue")
  public static let gunPowder = ColorAsset(name: "gunPowder")
  public static let leadingBlue = ColorAsset(name: "leadingBlue")
  public static let lightBlue = ColorAsset(name: "lightBlue")
  public static let lightGrey = ColorAsset(name: "lightGrey")
  public static let lightGrey2 = ColorAsset(name: "lightGrey2")
  public static let lightNavy = ColorAsset(name: "lightNavy")
  public static let maize = ColorAsset(name: "maize")
  public static let midnightBlue = ColorAsset(name: "midnightBlue")
  public static let offWhite = ColorAsset(name: "offWhite")
  public static let paleGrey = ColorAsset(name: "paleGrey")
  public static let paleGreyThree = ColorAsset(name: "paleGreyThree")
  public static let paleGreyTwo = ColorAsset(name: "paleGreyTwo")
  public static let shipCove = ColorAsset(name: "shipCove")
  public static let silver = ColorAsset(name: "silver")
  public static let soap = ColorAsset(name: "soap")
  public static let steel = ColorAsset(name: "steel")
  public static let steelGrey = ColorAsset(name: "steelGrey")
  public static let sunflowerYellow = ColorAsset(name: "sunflowerYellow")
  public static let titaniumYellow = ColorAsset(name: "titaniumYellow")
  public static let traillingBlue = ColorAsset(name: "traillingBlue")
  public static let warmGrey = ColorAsset(name: "warmGrey")
  public static let zambezi = ColorAsset(name: "zambezi")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class ColorAsset {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  public private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  public func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
