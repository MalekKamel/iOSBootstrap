//
// Created by Shaban Kamel on 11/10/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import Foundation

public extension Encodable {

    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self),
              let dictionary = try? JSONSerialization.jsonObject(with: data,
                      options: .allowFragments) as? [String: Any] else {
            return [:]
        }
        return dictionary
    }
}