//
// Created by Shaban on 23/06/2021.
//

import Combine
import Data

public typealias Request<T> = () -> AnyPublisher<T, AppError>

public struct CombineRequester {
    /// Set NSError handlers
    public static var nsErrorHandlers: Array<NSErrorHandler> = []

    /// Set Error handlers
    public static var errorHandlers: Array<ErrorHandler> = []

    /// Set Resumable handlers
    /// // - TODO:
//    public static var resumableHandlers: Array<ResumableHandler> = [UnauthorizedHandler()]
    public static var resumableHandlers: Array<ResumableHandler> = []

    public init() {
    }

    public func request<T>(
            _ publisher: @escaping @autoclosure () -> AnyPublisher<T, AppError>,
            options: RequestOptions = RequestOptions.defaultOptions(),
            presentable: Presentable? = nil
    ) -> AnyPublisher<T, Never> {
        if options.showLoading {
            presentable?.showLoading()
        }
        return publisher()
                .catch { error -> AnyPublisher<T, Never> in
                    options.doOnError?(error)

                    if options.inlineHandling?(error) == true {
                        return Combine.Empty<T, Never>().eraseToAnyPublisher()
                    }

                    if let resumableHandler = handleResumable(
                            error: error,
                            publisher: publisher(),
                            presentable: presentable) {
                        return resumableHandler
                    }

                    return handle(error: error, presentable: presentable)
                }
                .handleEvents(
                        receiveOutput: { value in
                            if options.hideLoading {
                                presentable?.hideLoading()
                            }
                        },
                        receiveCompletion: { _ in
                            if options.hideLoading {
                                presentable?.hideLoading()
                            }
                        })
                .eraseToAnyPublisher()
    }

    private func handleResumable<T>(
            error: Error,
            publisher: @escaping @autoclosure () -> AnyPublisher<T, AppError>,
            presentable: Presentable?) -> AnyPublisher<T, Never>? {
        let resumableHandler: ResumableHandler? = CombineRequester.resumableHandlers.first(where: {
            $0.canHandle(error: error)
        })

        guard let handler = resumableHandler else {
            return nil
        }

        return handler.handle(error: error, presentable: presentable)
                .flatMap { _ -> AnyPublisher<T, AppError> in
                    publisher()
                }
                .catch { error -> AnyPublisher<T, Never> in
                    handle(error: error, presentable: presentable)
                }
                .eraseToAnyPublisher()
    }

    private func handle<T>(error: Error, presentable: Presentable?) -> AnyPublisher<T, Never> {
        ErrorProcessor.shared.process(error: error, presentable: presentable)
        return Combine.Empty<T, Never>().eraseToAnyPublisher()
    }
}