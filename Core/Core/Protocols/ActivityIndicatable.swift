//Copyright HitchHiker© 2017. All rights reserved.

import UIKit

protocol ActivityIndicatable {
    var isLoading: Bool { get }
    func showLoading(show: Bool)
}

private let loadingViewTag = 4875618

extension ActivityIndicatable {

    var isLoading: Bool { return rootViewController.view.viewWithTag(loadingViewTag) != nil }

    func showLoading(show: Bool) {

        if show {
            let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
            effectView.tag = loadingViewTag

            let indicator = UIActivityIndicatorView(style: .gray)
            indicator.hidesWhenStopped = true
            indicator.startAnimating()
            effectView.contentView.addSubview(indicator)
            indicator.bindFrameToSuperviewBounds()

            effectView.frame = rootViewController.view.frame
            rootViewController.view.addSubview(effectView)
            effectView.bindFrameToSuperviewBounds()

            return
        }

        while let effectView = rootViewController.view.viewWithTag(loadingViewTag) {
            effectView.removeFromSuperview()
        }

    }

}
