// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum Strings {
  /// ADD TO CART
  public static let addToCart = Strings.tr("Localizable", "add_to_cart")
  /// Back
  public static let back = Strings.tr("Localizable", "back")
  /// Cart Empty
  public static let cartEmpty = Strings.tr("Localizable", "cart_empty")
  /// Catalog
  public static let catalog = Strings.tr("Localizable", "catalog")
  /// Confirm Transaction
  public static let confirmTransaction = Strings.tr("Localizable", "confirm_transaction")
  /// Done
  public static let done = Strings.tr("Localizable", "done")
  /// FREE
  public static let free = Strings.tr("Localizable", "free")
  /// IN YOUR CART
  public static let inYourCart = Strings.tr("Localizable", "in_your_cart")
  /// Name
  public static let name = Strings.tr("Localizable", "name")
  /// No Products To Display
  public static let noProductsToDisplay = Strings.tr("Localizable", "no_products_to_display")
  /// Notifications
  public static let notifications = Strings.tr("Localizable", "notifications")
  /// review
  public static let review = Strings.tr("Localizable", "review")
  /// Reviews
  public static let reviews = Strings.tr("Localizable", "reviews")
  /// Settings
  public static let settings = Strings.tr("Localizable", "settings")
  /// Show Ads
  public static let showAds = Strings.tr("Localizable", "show_ads")
  /// Sound Alerts
  public static let soundAlerts = Strings.tr("Localizable", "sound_alerts")
  /// Total
  public static let total = Strings.tr("Localizable", "total")
  /// Your Cart
  public static let youCart = Strings.tr("Localizable", "you_cart")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
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
