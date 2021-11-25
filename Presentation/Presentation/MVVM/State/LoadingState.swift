//
// Created by Shaban on 23/06/2021.
//

import SwiftUI

public class LoadingState: ObservableObject {
    @Published public var loading: Loading = .idle

    public init() {
    }

    public enum Loading {
        case idle
        case loading
    }
}

