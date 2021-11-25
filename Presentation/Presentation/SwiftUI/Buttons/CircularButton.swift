//
//  CircularButtonView.swift
//  Chauffeur
//
//  Created by Shaban Kamel on 16/09/2021.
//  Copyright © 2021 sha. All rights reserved.
//

import SwiftUI

public struct CircularButton: View {
    var icon: Image
    let foregroundColor: Color
    let backgroundColor: Color
    var action: () -> Void
    
    public init (icon: Image,
                 foregroundColor: Color = .white,
                 backgroundColor: Color ,
                 action: @escaping () -> ()) {
        self.icon = icon
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.action = action
    }
    public var body: some View {
        Button(action: action) {
            HStack {
                icon
            }
            .foregroundColor(foregroundColor)
            .padding()
            .background(backgroundColor)
            .frame(width: 44, height: 44)
            .clipShape(Circle())
        }
    }
}
