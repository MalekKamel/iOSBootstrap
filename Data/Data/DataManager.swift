import Foundation

public protocol DataManagerContract {

}

public struct DataManager: DataManagerContract {

    public static func build() -> DataManagerContract {
        DataManager()
    }

}
