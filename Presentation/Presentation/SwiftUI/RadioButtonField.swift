//
// Created by Apple on 20/03/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import SwiftUI

//MARK:- Single Radio Button Field
public struct RadioButtonField: View {
    let id: String
    let label: String
    let size: CGFloat
    let color: Color
    let textSize: CGFloat
    @Binding var isSelected: Bool
    let onTapped: (String) -> ()

    public init(
            id: String,
            label: String,
            size: CGFloat = 20,
            color: Color = Color.black,
            textSize: CGFloat = 14,
            isSelected: Binding<Bool>,
            onTapped: @escaping (String) -> ()
    ) {
        self.id = id
        self.label = label
        self.size = size
        self.color = color
        self.textSize = textSize
        self._isSelected = isSelected
        self.onTapped = onTapped
    }

    public var body: some View {
        Button(action: {
            isSelected.toggle()
            onTapped(id)
        }) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: size, height: size)
                Text(label)
                    .font(.system(size: textSize))
                Spacer()
            }.foregroundColor(color)
        }
                .foregroundColor(Color.white)
    }
}
