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
    associatedtype NavigationLinksView: View
    associatedtype LoadingViewType: View
    associatedtype ViewModel: AppViewModel

    /// The viewModel of this screen
    var vm: ViewModel { get set }

    var hasNavbar: Bool { get }

    /// The normal content view that should be shown to
    /// the user in the normal state.
    /// - Returns: Content
    @ViewBuilder var bodyContent: Content { get }

    /// The screen loading view.
    /// - Returns: AnyView
    func LoadingView() -> LoadingViewType

    /// Called when the root view appears.
    func onContentAppear()

    /// Called when the root view disappears.
    func onContentDisappear()

    /// Navigation links, added to the content for you.
    func NavigationLinks() -> NavigationLinksView
}

public extension AppScreen {

    var body: some View {
        ZStack {
            bodyContent
                    .loadingIndicator(state: vm.loadState, loadingView: LoadingView().eraseToAnyView())
                    .onAppear(perform: onContentAppear)
                    .onDisappear(perform: onContentDisappear)
            NavigationLinksContent()
        }.hideNavigationBar(!hasNavbar)
    }

    func LoadingView() -> some View {
        Spinner(isAnimating: true,
                style: .large,
                color: .black)
    }

    func onContentAppear() {
    }

    func onContentDisappear() {
    }

    func NavigationLinks() -> some View {
        EmptyView()
    }

   private func NavigationLinksContent() -> some View {
        Group {
            NavigationLinks()
            // This is a workaround to fix navigation issue
            // Look at this discussion:
            // https://developer.apple.com/forums/thread/677333
            NavigationLink(destination: EmptyView()) {
                EmptyView()
            }
        }
    }

    var hasNavbar: Bool {
        false
    }
}

