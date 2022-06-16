//
// Created by Shaban on 16/06/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import Foundation

import IQKeyboardManagerSwift
import SwiftUI

public struct KeyboardWrapper {

    public static func setup() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 10
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = Strings.done
    }
}

