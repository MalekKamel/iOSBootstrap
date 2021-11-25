//
// Created by Shaban on 17/07/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import SwiftUI

public struct CardView: ViewModifier {
    public init() {
    }

    public func body(content: Content) -> some View {
        content
                .background(
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.2), radius: 0.6)

        )
    }

}

public extension View {
    func cardView() -> some View {
        modifier(CardView())
    }
}