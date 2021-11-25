//
//  Decimal+Double.swift
//  Core
//
//  Created by Shaban Kamel on 05/10/2021.
//  Copyright © 2021 sha. All rights reserved.
//

import Foundation

public extension Decimal {
    var doubleValue: Double {
        NSDecimalNumber(decimal: self).doubleValue
    }
}
