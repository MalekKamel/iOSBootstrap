//
// Created by Shaban Kamel on 02/09/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import SwiftUI

extension ColorAsset {
    var swiftUiColor: SwiftUI.Color {
        SwiftUI.Color(name, bundle: PresentationBundleToken.bundle)
    }
}

