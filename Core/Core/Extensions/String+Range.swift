//
// Created by Shaban Kamel on 01/09/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import Foundation

public extension String {
    func range(from nsRange: NSRange) -> Range<String.Index>? {
        guard
                let from16 = utf16.index(utf16.startIndex, offsetBy: nsRange.location, limitedBy: utf16.endIndex),
                let to16 = utf16.index(from16, offsetBy: nsRange.length, limitedBy: utf16.endIndex),
                let from = String.Index(from16, within: self),
                let to = String.Index(to16, within: self)
                else {
            return nil
        }
        return from..<to
    }
}