//
// Created by Shaban Kamel on 01/09/2021.
// Copyright (c) 2021 sha. All rights reserved.
//


import SwiftUI

struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner

    struct CornerRadiusShape: Shape {

        var radius = CGFloat.infinity
        var corners = UIRectCorner.allCorners

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }

    func body(content: Content) -> some View {
        content
                .mask(CornerRadiusShape(radius: radius, corners: corners))
    }
}

public extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}

public extension Image {
    func thumbnail(for width: CGFloat) -> some View {
        resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: width)
    }
}
