//
// Created by Shaban Kamel on 03/09/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import Foundation

/// This class is used for getting the current Bundle only and doesn't contain any logic
class PresentationBundleToken {
   static var bundle = Bundle(for: PresentationBundleToken.self)
}
