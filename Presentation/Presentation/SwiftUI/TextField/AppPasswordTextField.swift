//
//  AppTextField.swift
//  Presentation
//
//  Created by Shaban Kamel on 31/08/2021.
//  Copyright © 2021 sha. All rights reserved.
//

import SwiftUI

public struct AppPasswordTextField: View {
    @State private var showPassword = false
    private var placeholder: String
    @Binding var text: String
    @State private var isFocused = false

    public init(placeholder: String, text: Binding<String>) {
        _text = text
        self.placeholder = placeholder
    }
    
    public var body: some View {
        HStack {
            AppUITextField(text: $text,
                           isRevealed: $showPassword,
                           isFocused: $isFocused,
                           placeholder : placeholder)
            Button(action: {
                showPassword.toggle()
            }) {
                Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                    .foregroundColor(Colors.darkIndigo.swiftUiColor)
            }
        }
        .padding()
        .font(.system(size: 16))
        .background(Colors.alabaster.swiftUiColor)
        .frame(height: 56)
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .strokeBorder(isFocused ? Colors.darkIndigo.swiftUiColor : Color.clear,
                              style: StrokeStyle(lineWidth: 1.0))
        )
        
    }
}

struct AppUITextField: UIViewRepresentable {

    // 1
    @Binding var text: String
    @Binding var isRevealed: Bool
    @Binding var isFocused: Bool
    var placeholder: String
     // 2
    func makeUIView(context: UIViewRepresentableContext<AppUITextField>) -> UITextField {
        let tf = UITextField(frame: .zero)
        tf.placeholder = placeholder
        tf.isUserInteractionEnabled = true
        tf.delegate = context.coordinator
        return tf
    }

    func makeCoordinator() -> AppUITextField.Coordinator {
        return Coordinator(text: $text, isFocused: $isFocused)
    }

    // 3
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
        uiView.isSecureTextEntry = !isRevealed
    }

    // 4
    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String
        @Binding var isFocused: Bool
        
        init(text: Binding<String>, isFocused: Binding<Bool>) {
            _text = text
            _isFocused = isFocused
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }

        func textFieldDidBeginEditing(_ textField: UITextField) {
            DispatchQueue.main.async {
               self.isFocused = true
            }
        }

        func textFieldDidEndEditing(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.isFocused = false
            }
        }

        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return false
        }
    }
}


