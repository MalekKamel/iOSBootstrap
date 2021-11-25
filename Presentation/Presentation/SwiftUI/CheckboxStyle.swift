//
// Created by Apple on 25/03/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import SwiftUI

public struct CheckboxStyle: ToggleStyle {
    public init() {

    }

    public func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(configuration.isOn ? .blue : .gray)
                    .font(.system(size: 20, weight: .regular, design: .default))
            configuration.label
        }
                .onTapGesture {
                    configuration.isOn.toggle()
                }
    }
}