//
// Created by Shaban on 09/06/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import Foundation

struct CartDataSrc {

    func loadCart() async throws -> [String] {
        try await Task.sleep(nanoseconds: 5_000_000_000)
        return try await withCheckedThrowingContinuation { continuation in
            continuation.resume(returning: ["Cart Item"])
        }
    }

}
