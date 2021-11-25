//
// Created by Shaban Kamel on 23/11/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import SwiftUI

extension FontConvertible {
    func swiftUiFont(size: CGFloat) -> SwiftUI.Font {
        SwiftUI.Font.custom(name, size: size)
    }

    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    func swiftUiFont(size: CGFloat, relativeTo textStyle: SwiftUI.Font.TextStyle) -> SwiftUI.Font {
        SwiftUI.Font.custom(name, size: size, relativeTo: textStyle)
    }

    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    func swiftUiFont(fixedSize: CGFloat) -> SwiftUI.Font {
        SwiftUI.Font.custom(name, fixedSize: fixedSize)
    }
}