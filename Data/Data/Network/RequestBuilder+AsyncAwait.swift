//
// Created by Shaban on 09/06/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import Foundation

public extension RequestBuilder {
    func request() async throws -> T {
        try await withCheckedThrowingContinuation { continuation in
            execute { response, error in
                if let error = error {
                    print("API Error: \(error.localizedDescription)")
                    let result = Result<T, AppError>.failure(error.toAppError)
                    continuation.resume(with: result)
                    return
                }

                let result = response!.body!
                continuation.resume(with: Result.success(result))
            }
        }
    }
}