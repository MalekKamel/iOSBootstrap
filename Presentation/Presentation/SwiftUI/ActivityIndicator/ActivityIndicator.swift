////
//// Created by Shaban on 17/05/2021.
//// Copyright (c) 2021 sha. All rights reserved.
////
//
//import SwiftUI
//
//struct ActivityIndicator: UIViewRepresentable {
//    typealias UIViewType = Alert
//
//    @Binding var isAnimating: Bool
//
//    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> Alert {
//        Alert()
//    }
//
//    func updateUIView(_ uiView: Alert, context: UIViewRepresentableContext<ActivityIndicator>) {
//        isAnimating ? uiView.startLoading() : uiView.stopLoading()
//    }
//
//    static func dismantleUIView(_ uiView: Alert, coordinator: ()) {
//
//    }
//}
//
//struct ActivityIndicatorModifier: ViewModifier {
//
//    func body(content: Content) -> some View {
//        ZStack {
//            content
//            ActivityIndicator(isAnimating: .constant(true))
//        }
//    }
//}
//
//extension View {
//    func activityIndicator() -> some View {
//        modifier(ActivityIndicatorModifier())
//    }
//}
//
//protocol LoadingStateProtocol {
//    var isLoading: Bool { get set }
//}
//
