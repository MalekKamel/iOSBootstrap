//
//  HeaderImage.swift
//  Presentation
//
//  Created by Shaban Kamel on 05/09/2021.
//  Copyright © 2021 sha. All rights reserved.
//

import SwiftUI

public struct TopHeaderImage: View {
    
    let image: Image
    
    public init(image: Image) {
        self.image = image
    }
    
    public var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 268, height: 196)
            .eraseToAnyView()
    }
}


