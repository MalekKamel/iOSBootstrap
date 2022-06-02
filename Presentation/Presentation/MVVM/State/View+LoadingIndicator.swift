//
// Created by Shaban on 23/06/2021.
//

import SwiftUI

public struct LoadingModifier: ViewModifier {
    @ObservedObject public var state: LoadingState
    public var loadingView: AnyView

    private var loadingViewOpacity: CGFloat {
        switch state.loading {
        case .idle:
            return .zero
        case .loading:
            return 1
        }
    }

    public func body(content: Content) -> some View {
        ZStack {
            content
            loadingView.opacity(loadingViewOpacity)
        }.eraseToAnyView()
    }

}

public extension View {
    func loadingIndicator(state: LoadingState, loadingView: AnyView) -> some View {
        modifier(LoadingModifier(
                state: state,
                loadingView: loadingView))
    }
}
