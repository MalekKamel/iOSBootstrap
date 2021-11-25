//
//  Popup.swift
//  Presentation
//
//  Created by Shaban Kamel on 7/11/21.
//  Copyright © 2021 sha. All rights reserved.
//

import SwiftUI

public struct Popup<T: View>: ViewModifier {
    public let popup: T
    public let alignment: Alignment
    public let direction: Direction
    public let isPresented: Bool

    public init(isPresented: Bool,
                alignment: Alignment,
                direction: Direction,
                @ViewBuilder content: () -> T) {
        self.isPresented = isPresented
        self.alignment = alignment
        self.direction = direction
        popup = content()
    }

    public func body(content: Content) -> some View {
        content
                .overlay(popupContent())
    }

    @ViewBuilder
    private func popupContent() -> some View {
        GeometryReader { geometry in
            if isPresented {
                popup
                        .animation(.spring())
                        .frame(width: UIScreen.main.bounds.width,
                                height: UIScreen.main.bounds.height,
                                alignment: alignment)
            }
        }
    }
}

public extension Popup {
    enum Direction {
        case top, bottom

        func offset(popupFrame: CGRect) -> CGFloat {
            switch self {
            case .top:
                let aboveScreenEdge = -popupFrame.maxY
                return aboveScreenEdge
            case .bottom:
                let belowScreenEdge = UIScreen.main.bounds.height - popupFrame.minY
                return belowScreenEdge
            }
        }
    }
}

public extension View {
    func popup<T: View>(
            isPresented: Bool,
            alignment: Alignment = .center,
            direction: Popup<T>.Direction = .bottom,
            @ViewBuilder content: () -> T
    ) -> some View {
        modifier(Popup(
                isPresented: isPresented,
                alignment: alignment,
                direction: direction,
                content: content))
    }
}
