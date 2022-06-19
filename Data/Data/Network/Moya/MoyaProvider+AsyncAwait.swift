//
// Created by Shaban on 19/06/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import Moya
import Combine

extension MoyaProvider {

    func request<T: Decodable>(target: Target) async throws -> T {
        try await withCheckedThrowingContinuation { continuation in
            request(target) {
                switch $0 {
                case let .success(response):
                    do {
                        print(response)
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(T.self, from: response.data)
                        continuation.resume(returning: result)
                    } catch {
                        print(error)
                        continuation.resume(throwing: error)
                    }
                case let .failure(error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
