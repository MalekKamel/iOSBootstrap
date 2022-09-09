//
// Created by Shaban on 09/09/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import UIKit

public extension UIApplication {

    static var rootViewController: UIViewController? {
        UIApplication.shared.windows.first?.rootViewController
    }
}
