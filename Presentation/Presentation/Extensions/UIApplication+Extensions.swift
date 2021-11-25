//
// Created by Shaban on 17/05/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import UIKit

extension UIApplication {

    var mainWindow: UIWindow? {
        UIApplication.shared.connectedScenes
                .filter({ $0.activationState == .foregroundActive })
                .map({ $0 as? UIWindowScene })
                .compactMap({ $0 })
                .first?.windows
                .filter({ $0.isKeyWindow }).last
    }

    func topViewController(controller: UIViewController? = UIApplication.shared.mainWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController, let selected = tabController.selectedViewController {
            return topViewController(controller: selected)
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }

    var topController: UIViewController? {
        let controller: UIViewController? = UIApplication.shared.mainWindow?.rootViewController
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController, let selected = tabController.selectedViewController {
            return topViewController(controller: selected)
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }


    var bottomAnchor: CGFloat {
        mainWindow?.safeAreaInsets.bottom ?? 0
    }

    var topAnchor: CGFloat {
        mainWindow?.safeAreaInsets.top ?? 0
    }
}

