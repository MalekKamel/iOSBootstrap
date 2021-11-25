//
// Created by Shaban on 10/07/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import Combine
import Alamofire
import Data
/*
// TODO
struct UnauthorizedHandler: ResumableHandler {
    func canHandle(error: Swift.Error) -> Bool {
        guard let appError = error as? AppError else {
            return false
        }
        switch appError {
        case .underlying(_, _, let error):
            guard let errorReponse = error as? ErrorResponse else {
                return false
            }
            switch errorReponse {
            case .error(_, _, let error):
                guard let afError = error as? AFError else {
                    return false
                }
                switch afError {
                case .responseValidationFailed(let reason):
                    switch reason {
                    case .unacceptableStatusCode(let code):
                        return code == 401
                    default: return false
                    }
                default: return false
                }
            }
        default: return false
        }

    }

    func handle(error: Error, presentable: Presentable?) -> AnyPublisher<Any, AppError> {
        let info = RefreshToken(token: defaults.refreshToken)
        let request: AnyPublisher<BasicApiResponse, AppError> =
                UserAPI.apiUserRefreshTokenPostWithRequestBuilder(body: info).request()

        return request
                .handleEvents(receiveOutput: { out in
                    defaults.token = out.data?.token ?? ""
                    defaults.refreshToken = out.data?.refreshToken ?? ""
                })
                .map { value in
                    value as Any
                }
                .eraseToAnyPublisher()
    }
}*/
