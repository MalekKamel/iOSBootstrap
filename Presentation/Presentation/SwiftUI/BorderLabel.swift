//
//  BorderLabel.swift
//  Presentation
//
//  Created by Shorouk Mohamed on 01/11/2021.
//  Copyright © 2021 sha. All rights reserved.
//

import SwiftUI

public struct BorderLabel: View {
    
    let borderColor: Color
    let image: Image
    let width:CGFloat
    let height:CGFloat
    
    public init(borderColor: Color = .clear,
                image :Image ,
                width :CGFloat = 48,
                height:CGFloat = 48) {
        self.image = image
        self.borderColor = borderColor
        self.width = width
        self.height = height
    }
    
    public var body: some View {
            image
                .resizable()
                .scaledToFit()
                .frame(minWidth: width, minHeight: height)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(borderColor, lineWidth: 2)
            ).cornerRadius(15)
       

    }
}


