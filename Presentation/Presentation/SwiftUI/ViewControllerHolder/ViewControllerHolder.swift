//
// Created by Shaban on 19/07/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import SwiftUI

struct ViewControllerHolder {
    weak var value: UIViewController?
}

struct ViewControllerKey: EnvironmentKey {
    static var defaultValue: ViewControllerHolder {
        ViewControllerHolder(value: UIApplication.shared.windows.first?.rootViewController)
    }
}

extension EnvironmentValues {
    var viewController: UIViewController? {
        get {
            self[ViewControllerKey.self].value
        }
        set {
            self[ViewControllerKey.self].value = newValue
        }
    }
}

public extension View {
    var viewController: UIViewController? {
        UIApplication.shared.windows.first?.rootViewController
    }
}