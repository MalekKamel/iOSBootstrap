//
// Created by Apple on 13/02/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import SwiftUI

public func GradientOverlay(colors: [Color] =  [.clear, Color(UIColor.black.withAlphaComponent(0.9))]) -> some View {
    Rectangle()
            .foregroundColor(.clear)
            .background(LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom))

}
