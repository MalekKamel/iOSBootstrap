//
// Created by Shaban Kamel on 07/01/2022.
// Copyright (c) 2022 sha. All rights reserved.
//


import SwiftUI

open class CoreSceneDelegate: UIResponder {
    public var window: UIWindow?
    public var windowScene: UIWindowScene?

    public func setupRootWindow<V: View>(rootView: V) {
        guard let windowScene = windowScene else {
            return
        }
        let window = UIWindow(windowScene: windowScene)
        let rootVC = AppHostingController(rootView: rootView)
        window.rootViewController = rootVC
        UINavigationBar.appearance().isHidden = true
        window.makeKeyAndVisible()
        self.window = window
    }
}

public struct RootWindow {
    public static func reset<V: View>(to rootView: V) {
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? CoreSceneDelegate else {
            return
        }
        sceneDelegate.setupRootWindow(rootView: rootView)
    }
}

public func navigate(toModule rootView: AnyView) {
    let navView = NavigationView {
        rootView
    }
    RootWindow.reset(to: navView)
}

