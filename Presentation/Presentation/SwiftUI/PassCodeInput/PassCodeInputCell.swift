//
//  PassCodeInputTextField.swift.swift
//  PassCodeInputDemo
//
//  Created by Shaban Kamel on 4/5/20.
//  Copyright © 2020 Anomaly Software. All rights reserved.
//

import Foundation
import SwiftUI

public protocol CharacterFieldBackspaceDelegate {
    /**
     - Parameter textField: A CharacterField instance
     */
    func charFieldWillDeleteBackward(_ textField: CharacterField)
}

public class CharacterField: UITextField {
    public var willDeleteBackwardDelegate: CharacterFieldBackspaceDelegate?

    public override func deleteBackward() {
        willDeleteBackwardDelegate?.charFieldWillDeleteBackward(self)
        super.deleteBackward()
    }

}

public struct PassCodeInputCell: UIViewRepresentable {
    // No one else should change this
    var index: Int

    // Bound from a PassCodeInputModel instance
    @Binding var selectedCellIndex: Int
    @Binding var textReference: String

    public func makeUIView(context: UIViewRepresentableContext<PassCodeInputCell>) -> CharacterField {
        let charField = CharacterField(frame: .zero)
        charField.textAlignment = .center
        charField.keyboardType = .numberPad

        // Caps and suggestions don't make sense
        charField.autocapitalizationType = .none
        charField.autocorrectionType = .no

        charField.delegate = context.coordinator
        charField.willDeleteBackwardDelegate = context.coordinator
        return charField
    }

    public func updateUIView(_ uiView: CharacterField,
                             context: UIViewRepresentableContext<PassCodeInputCell>) {
        if index == selectedCellIndex {
            uiView.becomeFirstResponder()
        }
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(
                index: index,
                selectedCellIndex: self.$selectedCellIndex,
                textReference: self.$textReference)
    }

    public class Coordinator: NSObject, UITextFieldDelegate, CharacterFieldBackspaceDelegate {
        // No one else should change this
        var index: Int
        // Each cell will update this
        @Binding var selectedCellIndex: Int
        // Reference to an index in the text array
        // from a PassCodeInputModel instance
        @Binding var textReference: String

        /**
         - Parameter index: Index of this cell in the pass code array
         - Parameter selectedCellIndex: index of where the user is upto
         - Parameter textReference: reference in the array to update input
         */
        init(index: Int,
             selectedCellIndex: Binding<Int>,
             textReference: Binding<String>) {
            // The underscore thing is important due to
            // the Binding<T> syntax
            _selectedCellIndex = selectedCellIndex
            _textReference = textReference
            self.index = index
        }

        public func textField(_ textField: UITextField,
                              shouldChangeCharactersIn range: NSRange,
                              replacementString string: String) -> Bool {

            let currentText = textField.text ?? "" //textField.text? will almost assuredly never be nil, but we should always assume it could be
            guard let stringRange = Range(range, in: currentText) else {
                return false
            }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

            // Increment the index if the change was on char
            if updatedText.count == 1 {
                selectedCellIndex += 1
            }

            // Stop input if there's more than one character
            return updatedText.count <= 1

        }

        public func textFieldDidChangeSelection(_ textField: UITextField) {
            textReference = textField.text ?? ""
        }

        public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
            selectedCellIndex = index
            return true
        }

        public func charFieldWillDeleteBackward(_ textField: CharacterField) {
            if (textField.text == "" && selectedCellIndex > 0) {
                selectedCellIndex -= 1
            }
        }

    }
}
