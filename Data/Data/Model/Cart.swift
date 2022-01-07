//
// Created by Shaban Kamel on 26/12/2021.
// Copyright © 2022 Shaban. All rights reserved.
//

import Foundation

public class Cart {
    public static let shared = Cart()

    public var items: [Product] = []

    public var total: Double {
        items.reduce(0) { (res, prod) -> Double in
            res + prod.price
        }
    }

    public func add(_ item: Product) {
        items.append(item)
    }

    public func remove(_ item: Product) {
        items.removeAll { (prod) -> Bool in
            prod.uuid == item.uuid
        }
    }

    public func contains(_ item: Product) -> Bool {
        items.contains(where: {
            $0.uuid == item.uuid
        })
    }
}
