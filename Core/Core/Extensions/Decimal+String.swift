//
//  Decimal+String.swift
//  Core
//
//  Created by Shaban Kamel on 05/10/2021.
//  Copyright © 2021 sha. All rights reserved.
//

import Foundation
public extension Decimal {
    var stringValue: String? {
        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true
        formatter.maximumFractionDigits = 2
        return formatter.string(from: self as NSDecimalNumber)
    }
}
