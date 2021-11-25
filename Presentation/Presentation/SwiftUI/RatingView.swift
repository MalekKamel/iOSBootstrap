//
//  RatingView.swift
//  Presentation
//
//  Created by Shaban Kamel on 19/09/2021.
//  Copyright © 2021 sha. All rights reserved.
//

import SwiftUI

public struct RatingView: View {
    @Binding private var selectedRate: Int
    private let isEditable: Bool
    
    public init(isEditable: Bool, selectedRate: Binding<Int>) {
        self.isEditable = isEditable
        _selectedRate = selectedRate
    }
    
  private func starIcon(index: Int) -> String {
        if index > selectedRate {
            return "star"
        }
        return "star.fill"
    }
    
    public func StarView(index: Int) -> some View {
        // TODO: Use AppSystemImage
        Image(systemName: starIcon(index: index))
            .resizable()
            .scaledToFit()
            .foregroundColor(Colors.yellow.swiftUiColor)
    }
    
    public func ItemView(index: Int) -> some View {
        if isEditable {
            return Button(action: {
               selectedRate = index
                print("index is \(index)")
            }) {
                StarView(index: index)
                    .frame(width: 30, height: 30)
            }.eraseToAnyView()
        } else {
            return StarView(index: index).eraseToAnyView()
        }
    }
    
    public var body: some View {
        HStack {
            ForEach(0..<5) { index in
                ItemView(index: index)
            }
        }
    }
}
