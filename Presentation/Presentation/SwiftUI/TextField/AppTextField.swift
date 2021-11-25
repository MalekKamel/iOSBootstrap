//
//  AppTextField.swift
//  Presentation
//
//  Created by Shaban Kamel on 31/08/2021.
//  Copyright © 2021 sha. All rights reserved.
//


import SwiftUI

public struct AppTextField: View {
    var titleKey: String
    @Binding var text: String
    var keyboardType: UIKeyboardType
    @State private var isEditing: Bool = false
    var onEditChange: (Bool) -> () = { _ in
    }
    var onCommit: () -> () = {
    }

    public init(
            titleKey: String,
            text: Binding<String>,
            keyboardType: UIKeyboardType = .default,
            onEditChange: @escaping (Bool) -> Void = { _ in
            },
            onCommit: @escaping () -> Void = {
            }
    ) {
        self.titleKey = titleKey
        self._text = text
        self.keyboardType = keyboardType
        self.onEditChange = onEditChange
        self.onCommit = onCommit
    }

    public var body: some View {
        TextField(titleKey,
                  text: $text,
                  onEditingChanged: {
                    onEditChange($0)
                    isEditing = $0
                  },
                  onCommit: onCommit)
            .keyboardType(keyboardType)
            .font(.system(size: 16))
            .padding()
            .background(Colors.alabaster.swiftUiColor)
            .frame(height: 56)
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(isEditing ? Colors.darkIndigo.swiftUiColor : Color.clear,
                                  style: StrokeStyle(lineWidth: 1.0))
            )
        
    }
}
