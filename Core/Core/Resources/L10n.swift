// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  /// available
  public static let available = L10n.tr("Localizable", "available")
  /// Cannot be less than
  public static let canNotBeLessThan = L10n.tr("Localizable", "can_not_be_less_than")
  /// Cannot be more than
  public static let canNotBeMoreThan = L10n.tr("Localizable", "can_not_be_more_than")
  /// Cancel
  public static let cancel = L10n.tr("Localizable", "cancel")
  /// Cash In/Out
  public static let cashInOut = L10n.tr("Localizable", "cash_in_out")
  /// Categories
  public static let categories = L10n.tr("Localizable", "categories")
  /// Choose between multiple POS modules here:
  public static let chooseBetweenMultipleModules = L10n.tr("Localizable", "choose_between_multiple_modules")
  /// Company Name
  public static let companyName = L10n.tr("Localizable", "company_name")
  /// Confirm Password
  public static let confirmPassword = L10n.tr("Localizable", "confirm_password")
  /// Country
  public static let country = L10n.tr("Localizable", "country")
  /// Discount
  public static let discount = L10n.tr("Localizable", "discount")
  /// Dismiss
  public static let dismiss = L10n.tr("Localizable", "dismiss")
  /// Email
  public static let email = L10n.tr("Localizable", "email")
  /// Error
  public static let error = L10n.tr("Localizable", "error")
  /// First Name
  public static let firstName = L10n.tr("Localizable", "first_name")
  /// Forgot Password?
  public static let forgotPassword = L10n.tr("Localizable", "forgot_password")
  /// Halls
  public static let halls = L10n.tr("Localizable", "halls")
  /// Hints
  public static let hints = L10n.tr("Localizable", "hints")
  /// Hold Orders
  public static let holdOrders = L10n.tr("Localizable", "hold_orders")
  /// Home
  public static let home = L10n.tr("Localizable", "home")
  /// Invalid
  public static let invalid = L10n.tr("Localizable", "Invalid")
  /// Invalid email address
  public static let invalidEMailAddress = L10n.tr("Localizable", "Invalid e-mail Address")
  /// Invalid date
  public static let invalidDate = L10n.tr("Localizable", "invalid_date")
  /// Invalid patterns
  public static let invalidPattern = L10n.tr("Localizable", "invalid_pattern")
  /// Keep me signed in
  public static let keepMeSigned = L10n.tr("Localizable", "keep_me_signed")
  /// Last Name
  public static let lastName = L10n.tr("Localizable", "last_name")
  /// Lock
  public static let lock = L10n.tr("Localizable", "lock")
  /// Manage Products
  public static let manageProducts = L10n.tr("Localizable", "manage_products")
  /// Must be
  public static let mustBe = L10n.tr("Localizable", "must_be")
  /// Not matching
  public static let notMatching = L10n.tr("Localizable", "not_matching")
  /// Online
  public static let online = L10n.tr("Localizable", "online")
  /// OOPS! something went wrong, please try again.
  public static let oopsSomethingWentWrong = L10n.tr("Localizable", "OOPS! something went wrong")
  /// Order No
  public static let orderNo = L10n.tr("Localizable", "order_no")
  /// Password
  public static let password = L10n.tr("Localizable", "password")
  /// Phone No
  public static let phoneNo = L10n.tr("Localizable", "phone_no")
  /// Photo Library
  public static let photoLibrary = L10n.tr("Localizable", "photo_library")
  /// Proceed
  public static let proceed = L10n.tr("Localizable", "proceed")
  /// Product
  public static let product = L10n.tr("Localizable", "product")
  /// These products have been chosen for you
  public static let productsChosenForYou = L10n.tr("Localizable", "products_chosen_for_you")
  /// Register Now
  public static let registerNow = L10n.tr("Localizable", "register_now")
  /// Required
  public static let `required` = L10n.tr("Localizable", "Required")
  /// SAR
  public static let sar = L10n.tr("Localizable", "sar")
  /// Saved Photos
  public static let savedPhotos = L10n.tr("Localizable", "saved_photos")
  /// Sign In
  public static let signIn = L10n.tr("Localizable", "sign_in")
  /// Sign Up
  public static let signUp = L10n.tr("Localizable", "sign_up")
  /// Start Your Session
  public static let startYourSession = L10n.tr("Localizable", "start_your_session")
  /// Subtotal
  public static let subtotal = L10n.tr("Localizable", "subtotal")
  /// Take Photo
  public static let takePhoto = L10n.tr("Localizable", "take_photo")
  /// Tax
  public static let tax = L10n.tr("Localizable", "tax")
  /// Total
  public static let total = L10n.tr("Localizable", "total")
  /// Transactions
  public static let transactions = L10n.tr("Localizable", "transactions")
  /// Write your company name
  public static let writeCompanyName = L10n.tr("Localizable", "write_company_name")
  /// Write your first name
  public static let writeFirstName = L10n.tr("Localizable", "write_first_name")
  /// Write your last name
  public static let writeLastName = L10n.tr("Localizable", "write_last_name")
  /// Write your phone number
  public static let writePhoneNo = L10n.tr("Localizable", "write_phone_no")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
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
