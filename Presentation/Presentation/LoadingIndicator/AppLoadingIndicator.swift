//
// Created by Shaban on 07/09/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import UIKit

public struct AppLoadingIndicator {
    private static let loadingViewTag = 4875618

    public static func show() {
        guard let viewController = UIApplication.rootViewController else {
            return
        }

        let effectView = UIView()
        effectView.tag = loadingViewTag

        let indicator: UIActivityIndicatorView
        indicator = UIActivityIndicatorView(style: .large)

        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        effectView.addSubview(indicator)
        indicator.bindFrameToSuperviewBounds()

        effectView.frame = viewController.view.frame
        viewController.view.addSubview(effectView)
        effectView.bindFrameToSuperviewBounds()
    }

    public static func hide() {
        guard let viewController = UIApplication.rootViewController else {
            return
        }
        while let effectView = viewController.view.viewWithTag(loadingViewTag) {
            effectView.removeFromSuperview()
        }
    }
}

extension UIView {
    /// Adds constraints to this `UIView` instances `superview` object to make sure this always has the same size as the superview.
    /// Please note that this has no effect if its `superview` is `nil` – add this `UIView` instance as a subview before calling this.
    func bindFrameToSuperviewBounds(insets: UIEdgeInsets = UIEdgeInsets.zero) {
        guard let superview = superview else {
            return
        }
        translatesAutoresizingMaskIntoConstraints = false

        superview.widthAnchor.constraint(equalTo: widthAnchor, constant: insets.left + insets.right).isActive = true
        superview.heightAnchor.constraint(equalTo: heightAnchor, constant: insets.top + insets.bottom).isActive = true
        superview.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        superview.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
