//
// Created by Shaban on 23/06/2021.
//

import Foundation


/// This protocol is responsible for presenting UI
public protocol AsyncManDelegate {

    /// show loading indicator
    func showLoading()

    /// hide loading indicator
    func hideLoading()

    ///  show error string
    func show(error: String)

    /// called when no error handler can handle the exception
    func onHandleErrorFailed(error: Error)
}

public class DummyPresentable: AsyncManDelegate {
    public init() {
    }

    public func show(error: String) {
    }

    public func showLoading() {
    }

    public func hideLoading() {
    }

    public func onHandleErrorFailed(error: Error) {
    }

}