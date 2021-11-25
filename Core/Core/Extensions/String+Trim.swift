//
// Created by Shaban Kamel on 01/09/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import Foundation

public extension String {
    var trim: String {
        trimmingCharacters(in: CharacterSet.whitespaces)
    }
}