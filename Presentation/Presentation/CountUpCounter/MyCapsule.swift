//
//  MyCapsule.swift
//  ChoufearApp
//
//  Created by Shaban Kamel on 26/09/2021.
//

import SwiftUI

public struct MyCapsule: Shape {
    public func path(in rect: CGRect) -> Path {
        var path = Path()

        let halfHeight = rect.height / 2
        let halfWidth = rect.width / 2

        path.move(to: CGPoint(x: halfWidth, y: 0))

        path.addLine(to: CGPoint(x: rect.width - halfHeight, y: 0))

        path.addCurve(to: CGPoint(x: rect.width, y: halfHeight),
                control1: CGPoint(x: rect.width, y: 0),
                control2: CGPoint(x: rect.width, y: halfHeight))

        path.addCurve(to: CGPoint(x: rect.width - halfHeight, y: rect.height),
                control1: CGPoint(x: rect.width, y: halfHeight),
                control2: CGPoint(x: rect.width, y: rect.height))

        path.addLine(to: CGPoint(x: halfHeight, y: rect.height))

        path.addCurve(to: CGPoint(x: 0, y: halfHeight),
                control1: CGPoint(x: 0, y: rect.height),
                control2: CGPoint(x: 0, y: halfHeight))

        path.addCurve(to: CGPoint(x: halfHeight, y: 0),
                control1: CGPoint(x: 0, y: 0),
                control2: CGPoint(x: halfHeight, y: 0))

        path.addLine(to: CGPoint(x: halfWidth, y: 0))


        return path
    }
}
