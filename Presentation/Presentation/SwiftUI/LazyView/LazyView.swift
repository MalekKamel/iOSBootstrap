//
// Created by Shaban Kamel on 19/10/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import SwiftUI

public struct LazyView<Content: View>: View {
    private let build: () -> Content

    public init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }

    public var body: Content {
        build()
    }
}