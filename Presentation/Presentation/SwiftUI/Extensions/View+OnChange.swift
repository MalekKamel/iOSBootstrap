//
// Created by Shaban Kamel on 06/09/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import Combine
import SwiftUI

/// See `View.onChange(of: value, perform: action)` for more information
struct ChangeObserver<Content: View, Value: Equatable>: View {
    let content: Content
    let value: Value
    @State private var oldValue: Value
    let action: (Value) -> Void

    init(value: Value,
         action: @escaping (Value) -> Void,
         content: @escaping () -> Content) {
        self.value = value
        self.action = action
        self.content = content()
        _oldValue = State(initialValue: value)
    }


    var body: some View {
        if oldValue != value {
            DispatchQueue.main.async {
                oldValue = value
                action(value)
            }
        }
        return content
    }
}

extension View {
    func onValueChange<Value: Equatable>(
            of value: Value,
            perform action: @escaping (_ newValue: Value) -> Void
    ) -> some View {
        Group {
            if #available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *) {
                self.onChange(of: value, perform: action)
            } else {
                ChangeObserver(value: value, action: action) {
                    self
                }
            }
        }
    }
}

//public extension View {
//    /// Adds a modifier for this view that fires an action when a specific value changes.
//    ///
//    /// You can use `onChange` to trigger a side effect as the result of a value changing, such as an Environment key or a Binding.
//    ///
//    /// `onChange` is called on the main thread. Avoid performing long-running tasks on the main thread. If you need to perform a long-running task in response to value changing, you should dispatch to a background queue.
//    ///
//    /// The new value is passed into the closure. The previous value may be captured by the closure to compare it to the new value. For example, in the following code example, PlayerView passes both the old and new values to the model.
//    ///
//    /// ```
//    /// struct PlayerView : View {
//    ///   var episode: Episode
//    ///   @State private var playState: PlayState
//    ///
//    ///   var body: some View {
//    ///     VStack {
//    ///       Text(episode.title)
//    ///       Text(episode.showTitle)
//    ///       PlayButton(playState: $playState)
//    ///     }
//    ///   }
//    ///   .onChange(of: playState) { [playState] newState in
//    ///     model.playStateDidChange(from: playState, to: newState)
//    ///   }
//    /// }
//    /// ```
//    ///
//    /// - Parameters:
//    ///   - value: The value to check against when determining whether to run the closure.
//    ///   - action: A closure to run when the value changes.
//    ///   - newValue: The new value that failed the comparison check.
//    /// - Returns: A modified version of this view
//    func onValueChange<Value: Equatable>(
//            of value: Value,
//            perform action: @escaping (_ newValue: Value) -> Void
//    ) -> some View {
//        Group {
//            if #available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *) {
//                self.onChange(of: value, perform: action)
//            } else {
//                ChangeObserver(value: value, action: action) {
//                    self
//                }
//            }
//        }
//    }
//}