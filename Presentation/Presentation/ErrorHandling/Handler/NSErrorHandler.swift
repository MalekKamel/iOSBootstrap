//
// Created by Shaban on 23/06/2021.
//

import Foundation

/// Handles NSError
public protocol NSErrorHandler {
    var supportedErrors: [Int] { get set }
    func canHandle(error: NSError) -> Bool
    func handle(error: NSError, presentable: Presentable?)
}

/// Default implementation for canHandle(:error)
public extension NSErrorHandler {
    func canHandle(error: NSError) -> Bool {
        let handler = supportedErrors.firstIndex(where: { $0 == error.code } )
        return handler != nil
    }
}
