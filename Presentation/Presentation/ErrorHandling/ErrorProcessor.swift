//
// Created by Shaban on 23/06/2021.
//

import Foundation

let errorProcessor = ErrorProcessor()

/// The class that processes the error and passes it to correct handlers
public class ErrorProcessor {
    static let shared = ErrorProcessor()

    func process(error: Swift.Error, presentable: Presentable?) {
        if let pluggableProcessor = self as? PluggableErrorProcessor,
           pluggableProcessor.handle(error: error, presentable: presentable) { return }

        if handleNSError(error: error as NSError, presentable: presentable) { return }

        if handle(error: error , presentable: presentable) { return }

        unknownError(error: error, presentable: presentable)
    }
}

private func handle(error: Swift.Error, presentable: Presentable?) -> Bool {
    let handler: ErrorHandler? = CombineRequester.errorHandlers.first(where: {
        $0.canHandle(error: error)
    })

    guard handler != nil else { return false }

    handler!.handle(error: error, presentable: presentable)
    return true
}

private func handleNSError(error: NSError, presentable: Presentable?) -> Bool {
    let handler: NSErrorHandler? = CombineRequester.nsErrorHandlers.first(where: {
        $0.canHandle(error: error)
    })

    guard handler != nil else { return false }

    handler!.handle(error: error, presentable: presentable)
    return true
}

private func unknownError(error: Swift.Error, presentable: Presentable?) {
    presentable?.onHandleErrorFailed(error: error)
}