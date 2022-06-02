//
// Created by Shaban on 17/05/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import SwiftUI

public struct Spinner: UIViewRepresentable {
    private let isAnimating: Bool
    private let style: UIActivityIndicatorView.Style
    private let color: UIColor

    public init(isAnimating: Bool,
                style: UIActivityIndicatorView.Style,
                color: UIColor) {
        self.isAnimating = isAnimating
        self.style = style
        self.color = color
    }

    public func makeUIView(context: UIViewRepresentableContext<Spinner>) -> UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView(style: style)
        spinner.hidesWhenStopped = true
        spinner.color = color
        return spinner
    }

    public func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Spinner>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}