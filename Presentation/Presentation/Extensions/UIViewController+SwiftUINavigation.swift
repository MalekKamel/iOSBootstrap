//
// Created by Shaban on 23/05/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import Foundation
import SwiftUI

public extension UIViewController {
    func present<Content: View>(
            presentationStyle: UIModalPresentationStyle = .fullScreen,
            transitionStyle: UIModalTransitionStyle = .coverVertical,
            animated: Bool = true,
            completion: @escaping () -> Void = {
            },
            @ViewBuilder builder: () -> Content) {
        let toPresent = HostingController(rootView: builder())
        if presentationStyle == .overCurrentContext {
            toPresent.view.backgroundColor = .clear
        }
        toPresent.modalPresentationStyle = presentationStyle
        present(toPresent, animated: animated, completion: completion)
    }

    func push<Content: View>(
            presentationStyle: UIModalPresentationStyle = .fullScreen,
            transitionStyle: UIModalTransitionStyle = .coverVertical,
            animated: Bool = true,
            completion: @escaping () -> Void = {
            },
            @ViewBuilder builder: () -> Content) {
        let toPresent = HostingController(rootView: builder())
        if presentationStyle == .overCurrentContext {
            toPresent.view.backgroundColor = .clear
        }
        toPresent.modalPresentationStyle = presentationStyle
        navigationController?.pushViewController(toPresent, animated: true)
    }
}
