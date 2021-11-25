//
// Created by Apple on 25/03/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import SwiftUI


public struct SectionHeader: View {
    let name: String
    let backgroundColor: Color
    let textColor: Color

    public init(name: String, backgroundColor: Color, textColor: Color = .white) {
        self.name = name
        self.backgroundColor = backgroundColor
        self.textColor = textColor
    }

    public var body: some View {
        VStack {
            Spacer()

            HStack {
                Spacer().frame(width: 20)
                Text(name).foregroundColor(textColor)
                Spacer()
            }.padding(0)

            Spacer()
        }.padding(0)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .background(backgroundColor)
    }

}

struct FillAll: View {
    let color: Color

    var body: some View {
        GeometryReader { proxy in
            color.frame(width: proxy.size.width * 1.3).fixedSize()
        }
    }
}
