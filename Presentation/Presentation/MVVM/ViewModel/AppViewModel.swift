//
// Created by Apple on 04/04/2021.
//

import SwiftUI
import Data
import Core
import Combine

public protocol AppViewModel: ObservableObject, Presentable {
    var requester: AsyncMan { get }
    var loadState: LoadingState { get set }
    var bag: CancelableBag { get set }
    var dataManager: DataManagerContract { get set }

    func request(
            options: RequestOptions,
            _ operation: @escaping AsyncRequest
    )
}

// MARK:- Presentable implementation
public extension AppViewModel {

    func showLoading() {
        loadState.loading = .loading
    }

    func hideLoading() {
        loadState.loading = .idle
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
            options: RequestOptions = RequestOptions.defaultOptions(),
            _ operation: @escaping AsyncRequest
    ) {
        requester
                .request(operation,
                        options: options,
                        presentable: self)
    }

}
