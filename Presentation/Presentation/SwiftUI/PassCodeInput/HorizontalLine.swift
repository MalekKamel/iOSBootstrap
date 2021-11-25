//
// Created by Shaban on 17/07/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import SwiftUI

struct HorizontalLineShape: Shape {

    func path(in rect: CGRect) -> Path {

        let fill = CGRect(
                x: 0,
                y: 0,
                width: rect.size.width,
                height: rect.size.height)
        var path = Path()
        path.addRoundedRect(in: fill, cornerSize: CGSize(width: 2, height: 2))

        return path
    }
}

public struct HorizontalLine: View {
    private var color: Color? = nil
    private var height: CGFloat = 1.0

    public init(color: Color, height: CGFloat = 1.0) {
        self.color = color
        self.height = height
    }

    public var body: some View {
        HorizontalLineShape()
                .fill(color!)
                .frame(minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: height,
                        maxHeight: height)
    }
}

struct HorizontalLine_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalLine(color: .black)
    }
}