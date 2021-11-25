
import Foundation

final class DataProvider: NSObject {
    var delegate: DataProviderDelegate?

    func start(completionBlock: @escaping () -> Void) {
        completionBlock()
    }
}

protocol DataProviderDelegate: class {

}

