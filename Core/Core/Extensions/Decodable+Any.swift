//
// Created by Shaban Kamel on 13/10/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import Foundation

public extension Decodable {
    init(from any: Any) throws {
        let data = try JSONSerialization.data(withJSONObject: any)
        self = try JSONDecoder().decode(Self.self, from: data)
    }
}
