import Foundation

public protocol DataManagerContract {
    var cartRepo: CartRepo { get }

}

public struct DataManager: DataManagerContract {
    public static let shared = DataManager()
    public var cartRepo: CartRepo = .shared

    public static func build() -> DataManagerContract {
        DataManager.shared
    }

}
