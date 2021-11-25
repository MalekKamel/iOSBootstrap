//
// Created by Shaban on 23/06/2021.
//

import Foundation


/// Generic error handler
public protocol ErrorHandler {
    func canHandle(error: Swift.Error) -> Bool
    func handle(error: Swift.Error, presentable: Presentable?)
}