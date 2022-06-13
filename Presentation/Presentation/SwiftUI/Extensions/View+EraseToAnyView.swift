//
// Created by Apple on 08/05/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import SwiftUI

public extension View {
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}
