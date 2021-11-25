//
// Created by Shaban on 23/06/2021.
//

import Foundation

/// Dynamic extension for ErrorProcessor
/// it's used to provide handlers for Alamofire & Moya
public protocol PluggableErrorProcessor {
    func handle(error: Error, presentable: Presentable?) -> Bool
}