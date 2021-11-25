//
//  VerificationField.swift
//  ChoufearApp
//
//  Created by Shaban Kamel on 24/08/2021.
//

import SwiftUI
import Core
import Combine

public struct VerificationField: View {
    @ObservedObject var viewModel: ViewModel
    var fields: Int
    var pinBackgroundColor: Color

    public init(fields: Int, pinBackgroundColor: Color, text: Binding<String>) {
        viewModel = ViewModel(text: text)
        self.fields = fields
        self.pinBackgroundColor = pinBackgroundColor
    }

    public var body: some View {
        ZStack {
            HStack(spacing: 10) {
                ForEach(0..<fields) { number in
                    Text(viewModel.singleText(for: number))
                            .frame(width: 44, height: 50)
                            .background(pinBackgroundColor)
                            .cornerRadius(15)
                }
            }
            TextField("", text: viewModel.inputText)
                    .keyboardType(.asciiCapableNumberPad)
                    .textContentType(.oneTimeCode)
                    .frame(height: 50)
                    .foregroundColor(.clear)
                    .accentColor(.clear)
        }
                .frame(width: 314)
                .environment(\.layoutDirection, .leftToRight)
    }
}

struct VerificationField_Previews: PreviewProvider {
    static var previews: some View {
        VerificationField(fields: 6, pinBackgroundColor: .gray, text: .constant(""))
    }
}



extension VerificationField {
    class ViewModel: ObservableObject {
        var inputText: Binding<String>

        init(text: Binding<String>) {
            inputText = text
        }

        func singleText(for number: Int) -> String {
            if inputText.wrappedValue.digits.count > number {
                return inputText.wrappedValue.digits[number].string
            }
            return ""
        }
    }
}



