import Foundation

public var defaults = Defaults()

enum DefaultsKey {
    case accessToken

    var name: String {
        get {
            "\(self)"
        }
    }
}

public struct Defaults {

    public var accessToken: String {
        get {
            AppDefaults.value(for: .accessToken) ?? ""
        }
        set {
            AppDefaults.save(value: newValue, key: .accessToken)
        }
    }

    public func clear() {
        AppDefaults.clear()
    }
}

