//
//  ProgressBar.swift
//  ChoufearApp
//
//  Created by Shaban Kamelm on 26/09/2021.
//

import SwiftUI

public struct ProgressBar: View {
    var counter: Int
    var countTo: Int

    public var body: some View {
        MyCapsule()
                .fill(Color.clear)
                .frame(width: 60, height: 27)
                .overlay(
                        MyCapsule().trim(from: 0, to: progress())
                                .stroke(
                                        style: StrokeStyle(
                                                lineWidth: 3,
                                                lineCap: .round,
                                                lineJoin: .round
                                        )
                                ).foregroundColor(
                                        Colors.darkIndigo.swiftUiColor
                                ).animation(
                                        .easeInOut(duration: 0.2)
                                )
                ).background(RoundedRectangle(cornerRadius: 9).fill(Colors.grayBackground.swiftUiColor))
    }

    public func completed() -> Bool {
        progress() == 1
    }

    public func progress() -> CGFloat {
        (CGFloat(counter) / CGFloat(countTo))
    }
}
