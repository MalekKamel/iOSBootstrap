//
// Created by Shaban on 31/07/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import Foundation

public extension Int {
    var string: String {
        String(self)
    }
}


public extension String {
//    var isNumber: Bool {
//        get {
//            !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
//        }
//    }
//
//    var english: String {
//        applyingTransform(StringTransform.toLatin, reverse: false) ?? self
//    }

    var digits: [Int] {
        self.compactMap {
            $0.wholeNumberValue
        }
    }

//    var caseNumericEnglishOnly: String {
//        if isNumber {
//            return english
//        }
//        return self
//    }

}


