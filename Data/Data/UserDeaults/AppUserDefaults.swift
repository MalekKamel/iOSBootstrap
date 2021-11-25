import Foundation

public var defaults = Defaults()

enum DefaultsKey {
    case fcmToken
    case accessToken
    case user

    var name: String {
        get {
            "\(self)"
        }
    }
}

public struct Defaults {
    public var fcmToken: String {
        get {
            AppDefaults.value(for: .fcmToken) ?? ""
        }
        set {
            AppDefaults.save(value: newValue, key: .fcmToken)
        }
    }

    public var accessToken: String {
        get {
            AppDefaults.value(for: .accessToken) ?? ""
        }
        set {
            AppDefaults.save(value: newValue, key: .accessToken)
        }
    }

    public var isLoggedIn: Bool {
        !accessToken.isEmpty
    }

    public func clear() {
        AppDefaults.clear()
    }
}

public struct AppDefaults {

    static func save<T: Codable>(
            value: T,
            keyEncoded: DefaultsKey,
            _ defaults: UserDefaults = UserDefaults.standard
    ) {
        save(value: try? PropertyListEncoder().encode(value), key: keyEncoded)
    }

    static func value<T: Decodable>(
            forEncoded key: DefaultsKey,
            _ defaults: UserDefaults = UserDefaults.standard
    ) -> T? {

        guard let data: Data = defaults.value(forKey: key.name) as? Data else {
            return nil
        }

        return try? PropertyListDecoder().decode(T.self, from: data) as T
    }

    static func saveArray<T: Codable>(
            value: [T],
            keyEncoded: DefaultsKey,
            _ defaults: UserDefaults = UserDefaults.standard
    ) {
        save(value: try? PropertyListEncoder().encode(value), key: keyEncoded)
    }

    static func valueArray<T: Decodable>(
            forEncoded key: DefaultsKey,
            _ defaults: UserDefaults = UserDefaults.standard
    ) -> [T]? {

        guard let data: Data = defaults.value(forKey: key.name) as? Data else {
            return nil
        }

        return try? PropertyListDecoder().decode([T].self, from: data) as [T]
    }

    static func save(
            value: Any?,
            key: DefaultsKey,
            _ defaults: UserDefaults = UserDefaults.standard
    ) {
        defaults.setValue(value, forKey: key.name)
        defaults.synchronize()
    }

    static func value<T>(
            for key: DefaultsKey,
            _ defaults: UserDefaults = UserDefaults.standard
    ) -> T? {
        defaults.value(forKey: key.name) as? T
    }

    static func clearValue(
            for key: DefaultsKey,
            _ defaults: UserDefaults = UserDefaults.standard
    ) {
        defaults.setValue(nil, forKey: key.name)
        defaults.synchronize()
    }

    public static func clear(_ defaults: UserDefaults = UserDefaults.standard) {
        let domain = Bundle.main.bundleIdentifier!
        defaults.removePersistentDomain(forName: domain)
        defaults.synchronize()
        print(Array(defaults.dictionaryRepresentation().keys).count)
    }
}
