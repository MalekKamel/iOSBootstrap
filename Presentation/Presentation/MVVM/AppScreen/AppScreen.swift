//
// Created by Apple on 04/04/2021.
//

import SwiftUI
import Core

/// A protocol that abstracts the common functionalities of a screen
/// The screen represents the main container that covers all the device screen.
/// NOT a single component.
public protocol AppScreen: View, Reportable {
    associatedtype Content: View
    associatedtype ViewModel: AppViewModel

    /// The viewModel of this screen
    var vm: ViewModel { get set }

    var hasNavbar: Bool { get }

    /// The normal content view that should be shown to
    /// the user in the normal state.
    /// - Returns: Content
    @ViewBuilder var bodyContent: Content { get }

    /// Called when the root view appears.
    func onContentAppear()

    /// Called when the root view disappears.
    func onContentDisappear()
}

public extension AppScreen {

    var body: some View {
        ZStack {
            bodyContent
                    .onAppear(perform: onContentAppear)
                    .onDisappear(perform: onContentDisappear)
        }.hideNavigationBar(!hasNavbar)
    }

    func onContentAppear() {
    }

    func onContentDisappear() {
    }

    var hasNavbar: Bool {
        false
    }
}

