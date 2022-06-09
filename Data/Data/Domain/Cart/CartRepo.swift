//
// Created by Shaban on 09/06/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import Foundation

public struct CartRepo {
    public static let shared = CartRepo.build()
    private let src: CartDataSrc

    public func loadCart() async throws -> [String] {
       try await src.loadCart()
    }

}

public extension CartRepo {

    static func build() -> CartRepo {
        CartRepo(src: CartDataSrc())
    }
}
