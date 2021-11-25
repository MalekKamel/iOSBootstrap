//
// Created by Shaban on 23/06/2021.
//

import SwiftUI

public struct LoadingModifier: ViewModifier {
    @ObservedObject public var state: LoadingState
    public var loadingView: AnyView

    public func body(content: Content) -> some View {
        GeometryReader { geometry in
            switch state.loading {
            case .idle:
                content.eraseToAnyView()
            case .loading:
                ZStack {
                    content
                    loadingView
                }.eraseToAnyView()
            }
        }
    }
}

public extension View {
    func loadingIndicator(state: LoadingState, loadingView: AnyView) -> some View {
        modifier(LoadingModifier(
                state: state,
                loadingView: loadingView))
    }
}
