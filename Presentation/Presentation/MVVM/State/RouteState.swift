//
// Created by Shaban on 25/06/2021.
//

import SwiftUI

public class RouteState<Route>: ObservableObject {
    @Published public var state: Route? = nil

    public init() {
    }
}