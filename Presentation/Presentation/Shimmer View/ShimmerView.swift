//
//  Shimmer View.swift
//  Presentation
//
//  Created by Shaban Kamel on 29/10/2021.
//  Copyright © 2021 sha. All rights reserved.
//

import SwiftUI

public struct TextShimmer: View {

    var text: String
    @State var animation = false

    public init(text: String, animation: Bool = false) {
        self.text = text
        self.animation = animation
    }

    public var body: some View {

        ZStack {

            Text(text)
                    .font(.system(size: 75, weight: .bold))
                    .foregroundColor(Color.gray.opacity(0.5))

            HStack(spacing: 0) {

                ForEach(0..<text.count, id: \.self) { index in

                    Text(String(text[text.index(text.startIndex, offsetBy: index)]))
                            .font(.system(size: 75, weight: .bold))
                            .foregroundColor(Color.white)
                }
            }
                    // Masking For Shimmer Effect...
                    .mask(

                            Rectangle()
                                    // For Some More Nice Effect Were Going to use Gradient...
                                    .fill(
                                            // You can use any Color Here...
                                            LinearGradient(gradient: .init(colors: [Color.white.opacity(0.5), Color.white, Color.white.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                                    )
                                    .rotationEffect(.init(degrees: 70))
                                    .padding(20)
                                    // Moving View continuously...
                                    // so it will create Shimmer Effect...
                                    .offset(x: -250)
                                    .offset(x: animation ? 500 : 0)
                    )
                    .onAppear(perform: {

                        withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {

                            animation.toggle()
                        }
                    })
        }
    }

    // Random Color....

    // It's Your Wish yOu can change anything here...
    // or you can also use Array of colors to pick random One....

    func randomColor() -> Color {
        let color = UIColor(red: 1, green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
        return Color(color)
    }
}
