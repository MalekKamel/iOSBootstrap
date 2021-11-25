//
// Created by Shaban on 09/07/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import Combine

public extension RequestBuilder {
    func request() -> AppPublisher<T> {
        let passSubject = PassthroughSubject<T, AppError>()
        execute {  response, error in
            if let error = error {
                print("API Error: \(error.localizedDescription)")
                passSubject.send(completion: .failure(error.toAppError))
                return
            }

            do {
                let result = response!.body!
                passSubject.send(result)
            } catch {
                print(error)
                passSubject.send(completion: .failure(error.toAppError))
            }
        }
        return passSubject.eraseToAnyPublisher()
    }
}