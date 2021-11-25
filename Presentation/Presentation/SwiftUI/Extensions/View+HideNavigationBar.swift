//
// Created by Shaban on 19/05/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import SwiftUI

public extension View {
    func hideNavigationBar(_ value: Bool) -> some View {
        guard value else {
            return eraseToAnyView()
        }
        return self
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
                .eraseToAnyView()
    }
}
