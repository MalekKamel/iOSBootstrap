//
// Created by Shaban Kamel on 23/11/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import SwiftUI

extension ImageAsset {
    var swiftUiImage: SwiftUI.Image {
        SwiftUI.Image(name, bundle: CoreBundleToken.bundle)
    }
}