// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum Strings {
  /// available
  public static let available = Strings.tr("Localizable", "available")
  /// Cannot be less than
  public static let canNotBeLessThan = Strings.tr("Localizable", "can_not_be_less_than")
  /// Cannot be more than
  public static let canNotBeMoreThan = Strings.tr("Localizable", "can_not_be_more_than")
  /// Cancel
  public static let cancel = Strings.tr("Localizable", "cancel")
  /// Cash In/Out
  public static let cashInOut = Strings.tr("Localizable", "cash_in_out")
  /// Categories
  public static let categories = Strings.tr("Localizable", "categories")
  /// Choose between multiple POS modules here:
  public static let chooseBetweenMultipleModules = Strings.tr("Localizable", "choose_between_multiple_modules")
  /// Company Name
  public static let companyName = Strings.tr("Localizable", "company_name")
  /// Confirm Password
  public static let confirmPassword = Strings.tr("Localizable", "confirm_password")
  /// Country
  public static let country = Strings.tr("Localizable", "country")
  /// Discount
  public static let discount = Strings.tr("Localizable", "discount")
  /// Dismiss
  public static let dismiss = Strings.tr("Localizable", "dismiss")
  /// Email
  public static let email = Strings.tr("Localizable", "email")
  /// Error
  public static let error = Strings.tr("Localizable", "error")
  /// First Name
  public static let firstName = Strings.tr("Localizable", "first_name")
  /// Forgot Password?
  public static let forgotPassword = Strings.tr("Localizable", "forgot_password")
  /// Halls
  public static let halls = Strings.tr("Localizable", "halls")
  /// Hints
  public static let hints = Strings.tr("Localizable", "hints")
  /// Hold Orders
  public static let holdOrders = Strings.tr("Localizable", "hold_orders")
  /// Home
  public static let home = Strings.tr("Localizable", "home")
  /// Invalid
  public static let invalid = Strings.tr("Localizable", "Invalid")
  /// Invalid email address
  public static let invalidEMailAddress = Strings.tr("Localizable", "Invalid e-mail Address")
  /// Invalid date
  public static let invalidDate = Strings.tr("Localizable", "invalid_date")
  /// Invalid patterns
  public static let invalidPattern = Strings.tr("Localizable", "invalid_pattern")
  /// Keep me signed in
  public static let keepMeSigned = Strings.tr("Localizable", "keep_me_signed")
  /// Last Name
  public static let lastName = Strings.tr("Localizable", "last_name")
  /// Lock
  public static let lock = Strings.tr("Localizable", "lock")
  /// Manage Products
  public static let manageProducts = Strings.tr("Localizable", "manage_products")
  /// Must be
  public static let mustBe = Strings.tr("Localizable", "must_be")
  /// Not matching
  public static let notMatching = Strings.tr("Localizable", "not_matching")
  /// Online
  public static let online = Strings.tr("Localizable", "online")
  /// OOPS! something went wrong, please try again.
  public static let oopsSomethingWentWrong = Strings.tr("Localizable", "OOPS! something went wrong")
  /// Order No
  public static let orderNo = Strings.tr("Localizable", "order_no")
  /// Password
  public static let password = Strings.tr("Localizable", "password")
  /// Phone No
  public static let phoneNo = Strings.tr("Localizable", "phone_no")
  /// Photo Library
  public static let photoLibrary = Strings.tr("Localizable", "photo_library")
  /// Proceed
  public static let proceed = Strings.tr("Localizable", "proceed")
  /// Product
  public static let product = Strings.tr("Localizable", "product")
  /// These products have been chosen for you
  public static let productsChosenForYou = Strings.tr("Localizable", "products_chosen_for_you")
  /// Register Now
  public static let registerNow = Strings.tr("Localizable", "register_now")
  /// Required
  public static let `required` = Strings.tr("Localizable", "Required")
  /// SAR
  public static let sar = Strings.tr("Localizable", "sar")
  /// Saved Photos
  public static let savedPhotos = Strings.tr("Localizable", "saved_photos")
  /// Sign In
  public static let signIn = Strings.tr("Localizable", "sign_in")
  /// Sign Up
  public static let signUp = Strings.tr("Localizable", "sign_up")
  /// Start Your Session
  public static let startYourSession = Strings.tr("Localizable", "start_your_session")
  /// Subtotal
  public static let subtotal = Strings.tr("Localizable", "subtotal")
  /// Take Photo
  public static let takePhoto = Strings.tr("Localizable", "take_photo")
  /// Tax
  public static let tax = Strings.tr("Localizable", "tax")
  /// Total
  public static let total = Strings.tr("Localizable", "total")
  /// Transactions
  public static let transactions = Strings.tr("Localizable", "transactions")
  /// Write your company name
  public static let writeCompanyName = Strings.tr("Localizable", "write_company_name")
  /// Write your first name
  public static let writeFirstName = Strings.tr("Localizable", "write_first_name")
  /// Write your last name
  public static let writeLastName = Strings.tr("Localizable", "write_last_name")
  /// Write your phone number
  public static let writePhoneNo = Strings.tr("Localizable", "write_phone_no")
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
