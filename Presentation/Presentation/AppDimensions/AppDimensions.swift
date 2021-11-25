//
// Created by Apple on 12/02/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import UIKit

public class AppDimensions {

    public static func listHeight(itemsCount: Int) -> CGFloat {
        guard UserInterface.isIPhone() else {
            return .infinity
        }
        if itemsCount == 0 {
            return 0
        }
        if itemsCount == 1 {
            return 250
        }
        return 400
    }
}