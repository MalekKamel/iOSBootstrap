//
// Created by Shaban on 09/06/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import Foundation

struct CartDataSrc {

    func loadCart() async throws -> [String] {
        try await withCheckedThrowingContinuation { continuation in
            continuation.resume(returning: ["Cart Item"])
        }
    }

}
