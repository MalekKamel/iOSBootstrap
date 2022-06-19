//
// Created by Shaban on 18/05/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import Moya
import Combine

public typealias DecodePublisher<T: Decodable> = AnyPublisher<T, AppError>
public typealias AppPublisher<T> = AnyPublisher<T, AppError>

extension MoyaProvider {
    func request<R: Decodable>(target: Target) -> DecodePublisher<R> {
        let passSubject = PassthroughSubject<R, AppError>()
        request(target) {
            switch $0 {
            case let .success(response):
                do {
                    print(response)
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(R.self, from: response.data)
                    passSubject.send(result)
                } catch {
                    print(error)
                    passSubject.send(completion: .failure(error.toAppError))
                }
            case let .failure(error):
                passSubject.send(completion: .failure(error.toAppError))
            }
        }
        return passSubject.eraseToAnyPublisher()
    }
}