//
// Created by Shaban on 15/07/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import SwiftUI

public extension View {
    @ViewBuilder func applyIf<T: View>(
            _ condition: @autoclosure () -> Bool,
            apply: (Self) -> T) -> some View {
        if condition() {
            apply(self)
        } else {
            self
        }
    }
}

