//
// Created by Shaban on 17/07/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import SwiftUI

public extension View {
    func glow(color: Color = .red, radius: CGFloat = 20) -> some View {
        shadow(color: color, radius: radius / 3)
                .shadow(color: color, radius: radius / 3)
                .shadow(color: color, radius: radius / 3)
    }
}
