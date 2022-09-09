//
// Created by Apple on 04/04/2021.
//

import SwiftUI
import Data
import Core
import Combine

public protocol AppViewModel: ObservableObject, AsyncManDelegate {
    var requester: AsyncMan { get }
    var dataManager: DataManagerContract { get set }

    func request(
            inlineHandling: ((Error) -> Bool)?,
            doOnError: ((Error) -> Void)?,
            showLoading: Bool,
            hideLoading: Bool,
            _ operation: @escaping AsyncOperation
    )
}

// MARK:- AsyncManDelegate implementation
public extension AppViewModel {

    func showLoading() {
        onMainThread {
            AppLoadingIndicator.show()
        }
    }

    func hideLoading() {
        onMainThread {
            AppLoadingIndicator.hide()
        }
    }


    func show(error: String) {
        Reporter.shared.show(error: error)
    }

    func onHandleErrorFailed(error: Error) {
        Reporter.shared.show(error: error.underlyingErrorDescription)
    }
}

public extension AppViewModel {

    func request(
            inlineHandling: ((Error) -> Bool)? = nil,
            doOnError: ((Error) -> Void)? = nil,
            showLoading: Bool = true,
            hideLoading: Bool = true,
            _ operation: @escaping AsyncOperation
    ) {
        let options = RequestOptions.Builder()
                .inlineErrorHandling(inlineHandling)
                .doOnError(doOnError)
                .showLoading(showLoading)
                .hideLoading(hideLoading)
                .build()
        requester.request(
                operation,
                options: options,
                presentable: self)
    }
}
