//
// Created by Shaban on 14/06/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import SwiftUI


public extension View {
    func infiniteSize() -> some View {
        frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
