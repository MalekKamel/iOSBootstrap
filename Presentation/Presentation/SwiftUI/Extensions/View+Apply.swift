//
// Created by Shaban on 18/07/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import SwiftUI

public extension View {
    @ViewBuilder func apply<T: View>(apply: (Self) -> T) -> some View {
        apply(self)
    }
}
