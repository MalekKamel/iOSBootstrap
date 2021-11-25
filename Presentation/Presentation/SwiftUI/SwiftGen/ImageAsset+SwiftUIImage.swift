//
// Created by Shaban Kamel on 03/09/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import SwiftUI

extension ImageAsset {
    var swiftUiImage: SwiftUI.Image {
        SwiftUI.Image(name, bundle: Bundle(for: PresentationBundleToken.self))
    }
}
