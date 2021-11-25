//
//  PassCodeInputField.swift
//  PassCodeInputDemo
//
//  Created by Shaban Kamel on 4/5/20.
//  Copyright © 2020 Anomaly Software. All rights reserved.
//

import SwiftUI
import Foundation

public struct PinView: View {
    @ObservedObject var model: PinViewModel
    let style: PassCodeInputStyle

    public init(model: PinViewModel, style: PassCodeInputStyle) {
        self.model = model
        self.style = style
    }

    public var body: some View {
        HStack {
            ForEach(0..<model.numberOfCells) { index in
                CellView(index: index)
            }
        }
    }

    private func CellView(index: Int) -> some View {
        PassCodeInputCell(
                index: index,
                selectedCellIndex: self.$model.selectedCellIndex,
                textReference: self.$model.passCode[index]
        ).frame(height: 24)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.horizontal, 5)
                .padding(.vertical, 10)
                .apply { view -> AnyView in
                    switch style {
                    case .roundedRectangle(let color):
                        return view
//                                .overlay(
//                                        RoundedRectangle(cornerRadius: 15)
////                                        .fill(color)
//                                )
                                .background(color)
                                .cornerRadius(15)
                                .eraseToAnyView()
                    case .underline(let color):
                        return  VStack {
                            view
                            HorizontalLine(color: color)
                        }.eraseToAnyView()
                    }
                }
        .keyboardType(.numberPad)
    }
}

public enum PassCodeInputStyle {
    case roundedRectangle(Color)
    case underline(Color)
}

struct PassCodeInputField_Previews: PreviewProvider {
    static var previews: some View {
        PinView(model: PinViewModel(passCodeLength: 6), style: .underline(.black))
    }
}
