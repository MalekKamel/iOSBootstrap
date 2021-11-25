//
//  SubmitButton.swift
//  Presentation
//
//  Created by Shaban Kamel on 05/09/2021.
//  Copyright © 2021 sha. All rights reserved.
//

import SwiftUI

public struct AppRoundedButton: View {
    let text: String
    let foregroundColor: Color
    let backgroundColor: Color
    let borderColor: Color
    let textSize: CGFloat
    let padding: CGFloat?
    let maxWidth: CGFloat
    let action: () -> Void

    // TODO: don't pass padding. Let the calling code handle it on site.
    public init(text: String,
                foregroundColor: Color = .white,
                backgroundColor: Color? = nil,
                borderColor: Color = Color.clear,
                textSize: CGFloat = 18,
                padding: CGFloat? = nil,
                maxWidth: CGFloat = .infinity,
                action: @escaping () -> ()) {
        self.text = text
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor ?? Colors.darkIndigo.swiftUiColor
        self.borderColor = borderColor
        self.textSize = textSize
        self.padding = padding
        self.maxWidth = maxWidth
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Text(text)
                .foregroundColor(foregroundColor)
                .font(FontFamily.Roboto.medium.swiftUiFont(size: 18))
                .frame(maxWidth: maxWidth)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(borderColor, lineWidth: 2)
                )
            
        }.background(backgroundColor)
                .cornerRadius(15)
//                .padding(.all, padding)
    }
}




