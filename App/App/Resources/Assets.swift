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
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
public typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum Assets {
  public static let licenseLarge = ImageAsset(name: "license-large")
  public static let licenseSmall = ImageAsset(name: "license-small")
  public static let personalIdLarge = ImageAsset(name: "personalId-large")
  public static let personalIdSmall = ImageAsset(name: "personalId-small")
  public static let visaLarge = ImageAsset(name: "visa-large")
  public static let visaSmall = ImageAsset(name: "visa-small")
  public static let cancelLocationIcon = ImageAsset(name: "cancel-location-icon")
  public static let closePopup = ImageAsset(name: "close-popup")
  public static let close = ImageAsset(name: "close")
  public static let carInsurance = ImageAsset(name: "car-insurance")
  public static let carLicense = ImageAsset(name: "car-license")
  public static let emailLogo = ImageAsset(name: "email-logo")
  public static let pdfLogo = ImageAsset(name: "pdf-logo")
  public static let amex = ImageAsset(name: "AMEX")
  public static let arrowsImage = ImageAsset(name: "ArrowsImage")
  public static let mc = ImageAsset(name: "MC")
  public static let visa = ImageAsset(name: "VISA")
  public static let amexPayment = ImageAsset(name: "amex-payment")
  public static let masterCardPayment = ImageAsset(name: "master-card-payment")
  public static let visaPayment = ImageAsset(name: "visa-payment")
  public static let branchesCheck = ImageAsset(name: "branches-check")
  public static let branchesMark = ImageAsset(name: "branches-mark")
  public static let branchesMark2 = ImageAsset(name: "branches-mark2")
  public static let branchesSearch = ImageAsset(name: "branches-search")
  public static let carMarker = ImageAsset(name: "car-marker")
  public static let clock = ImageAsset(name: "clock")
  public static let locationIcon = ImageAsset(name: "location-icon")
  public static let markerSideBlue = ImageAsset(name: "marker-side-blue")
  public static let selectedMarker = ImageAsset(name: "selected-marker")
  public static let unselectedMarker = ImageAsset(name: "unselected-marker")
  public static let branches = ImageAsset(name: "branches")
  public static let changeLanguage = ImageAsset(name: "change-language")
  public static let contactUs = ImageAsset(name: "contact-us")
  public static let darkModeLogo = ImageAsset(name: "dark-mode-logo")
  public static let faq = ImageAsset(name: "faq")
  public static let instagram = ImageAsset(name: "instagram")
  public static let linkedin = ImageAsset(name: "linkedin")
  public static let logout = ImageAsset(name: "logout")
  public static let myBookings = ImageAsset(name: "my-bookings")
  public static let privacyPolicy = ImageAsset(name: "privacy-policy")
  public static let rentCar = ImageAsset(name: "rent-car")
  public static let servicesMenu = ImageAsset(name: "services-menu")
  public static let sideArrowLarge = ImageAsset(name: "side-arrow-large")
  public static let termsConditions = ImageAsset(name: "terms-conditions")
  public static let twitter = ImageAsset(name: "twitter")
  public static let whatsapp = ImageAsset(name: "whatsapp")
  public static let yellowArrow = ImageAsset(name: "yellow-arrow")
  public static let youtube = ImageAsset(name: "youtube")
  public static let circleCheckEmpty = ImageAsset(name: "circle-check-empty")
  public static let circleCheckFill = ImageAsset(name: "circle-check-fill")
  public static let emptyRadioIcon = ImageAsset(name: "empty-radio-icon")
  public static let emptyRatingStar = ImageAsset(name: "empty-rating-star")
  public static let fillRadioIcon = ImageAsset(name: "fill-radio-icon")
  public static let fillRatingStar = ImageAsset(name: "fill-rating-star")
  public static let hidePasswordIcon = ImageAsset(name: "hide-password-icon")
  public static let radioChecked = ImageAsset(name: "radio-checked")
  public static let radioEmpty = ImageAsset(name: "radio-empty")
  public static let showPasswordIcon = ImageAsset(name: "show-password-icon")
  public static let squareCheckEmpty = ImageAsset(name: "square-check-empty")
  public static let squareCheckFill = ImageAsset(name: "square-check-fill")
  public static let squareLargeCheckEmpty = ImageAsset(name: "square-large-check-empty")
  public static let toggleBackground = ImageAsset(name: "toggle-background")
  public static let addCreditCard = ImageAsset(name: "add-credit-card")
  public static let addPayment = ImageAsset(name: "add-payment")
  public static let calendarIcon = ImageAsset(name: "calendar-icon")
  public static let deleteIcon = ImageAsset(name: "delete-icon")
  public static let editPin = ImageAsset(name: "edit-pin")
  public static let editProfilePin = ImageAsset(name: "edit-profile-pin")
  public static let enterArrow = ImageAsset(name: "enter-arrow")
  public static let icOtp = ImageAsset(name: "ic_otp")
  public static let icPhone = ImageAsset(name: "ic_phone")
  public static let icRiyadh = ImageAsset(name: "ic_riyadh")
  public static let icShowPass = ImageAsset(name: "ic_show_pass")
  public static let menuIcon = ImageAsset(name: "menu-icon")
  public static let previewEye = ImageAsset(name: "preview-eye")
  public static let searchIcon = ImageAsset(name: "search-icon")
  public static let yellowCamera = ImageAsset(name: "yellow-camera")
  public static let yourCarMarker = ImageAsset(name: "your-car-marker")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public struct ImageAsset {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  public var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  public func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif
}

public extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
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
