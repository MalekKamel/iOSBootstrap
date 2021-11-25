//
// Created by Apple on 04/04/2021.
//

import SwiftUI
import Data
import Core
import Combine

public protocol AppViewModel: ObservableObject, Presentable {
    var requester: CombineRequester { get }
    var loadState: LoadingState { get set }
    var bag: CancelableBag { get set }
    var dataManager: DataManagerContract { get set }

    func request<T>(_ api: @escaping @autoclosure () -> AnyPublisher<T, AppError>, options: RequestOptions) -> AnyPublisher<T, Never>
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

    func request<T>(_ api: @escaping @autoclosure () -> AnyPublisher<T, AppError>,
                    options: RequestOptions = RequestOptions.defaultOptions()
    ) -> AnyPublisher<T, Never> {
        requester
                .request(api(), options: options, presentable: self)
                .subscribe(on: DispatchQueue.global())
                .receive(on: RunLoop.main)
                .eraseToAnyPublisher()
    }

}
