//
// Created by Shaban on 23/06/2021.
//

import Foundation

/// The class that processes the error and passes it to the correct handlers
public class ErrorProcessor {
    static let shared = ErrorProcessor()

    func process(error: Swift.Error, presentable: AsyncManDelegate?) {
        if handleNSError(error: error as NSError, presentable: presentable) {
            return
        }

        if handle(error: error, presentable: presentable) {
            return
        }

        unknownError(error: error, presentable: presentable)
    }
}

private func handle(error: Swift.Error, presentable: AsyncManDelegate?) -> Bool {
    let handler: ErrorHandler? = AsyncMan.errorHandlers.first(where: {
        $0.canHandle(error: error)
    })

    guard handler != nil else {
        return false
    }

    handler!.handle(error: error, presentable: presentable)
    return true
}

private func handleNSError(error: NSError, presentable: AsyncManDelegate?) -> Bool {
    let handler: NSErrorHandler? = AsyncMan.nsErrorHandlers.first(where: {
        $0.canHandle(error: error)
    })

    guard handler != nil else {
        return false
    }

    handler!.handle(error: error, presentable: presentable)
    return true
}

private func unknownError(error: Swift.Error, presentable: AsyncManDelegate?) {
    presentable?.onHandleErrorFailed(error: error)
}