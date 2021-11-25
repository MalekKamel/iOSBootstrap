//
// Created by Apple on 27/03/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import SwiftUI

public struct AdaptiveStack<Content: View>: View {
    let horizontalAlignment: HorizontalAlignment
    let verticalAlignment: VerticalAlignment
    let spacing: CGFloat?
    let content: () -> Content

    public init(horizontalAlignment: HorizontalAlignment = .center,
                verticalAlignment: VerticalAlignment = .center,
                spacing: CGFloat? = nil,
                @ViewBuilder content: @escaping () -> Content) {
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
        self.spacing = spacing
        self.content = content
    }

    public var body: some View {
        Group {
            switch UserInterface.idiom() {
            case .iPhone:
                VStack(alignment: horizontalAlignment,
                        spacing: spacing,
                        content: content)
            case .iPad:
                HStack(alignment: verticalAlignment,
                        spacing: spacing,
                        content: content)
            }
        }
    }
}
