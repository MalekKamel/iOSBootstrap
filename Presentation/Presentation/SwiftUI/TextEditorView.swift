//
//  TextEditorView.swift
//  Presentation
//
//  Created by Shaban Kamel on 30/09/2021.
//  Copyright © 2021 sha. All rights reserved.
//

import SwiftUI

public struct TextEditorView : View{
    var color : Color
    @Binding var text : String
    public init(color: Color, text: Binding<String>) {
        UITextView.appearance().backgroundColor = .clear
        self.color = color
        _text = text
    }
    public var body: some View {
        if #available(iOS 14.0, *) {
            TextEditor(text: $text)
                .frame(height: 150)
                           .padding()
                           .background(RoundedRectangle(cornerRadius: 15).fill(color)).padding(20)
        } else {
            // Fallback on earlier versions
        }
    }

}

