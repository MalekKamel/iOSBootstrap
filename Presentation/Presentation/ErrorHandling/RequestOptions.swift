//
// Created by Shaban on 23/06/2021.
//

import Foundation

public class RequestOptions {

    ///  callback for handling the error at call site
    ///  @return true if the error is handled, false otherwise
    ///  If the error wasn't handled(by returning false), the provided
    ///  handlers will try to handle the error.
    ///  If all handlers failed, [Presentable#onHandleErrorFailed(Throwable]
    ///   will be called
    var inlineHandling: ((Error) -> Bool)? = nil

    /// Invoke error on error
    var doOnError: ((Error) -> Void)? = nil

    /// show loading indicator
    var showLoading: Bool = true

    /// hide loading indicator
    var hideLoading: Bool = true

    public class Builder {
        private var options = RequestOptions()

        public init() {}

        /// Provide a callback to handle the error inline.
        /// Returning true means that the error has been handled inline
        /// Returning false means the error couldn't be handled inline, and in this case
        /// the error will be passed to global handlers to handle it.
        public func inlineErrorHandling(_ callback: ((Error) -> Bool)?) -> Builder {
            options.inlineHandling = callback
            return self
        }

        /// Provide a callback to be invoked when an error occurs.
        public func doOnError(_ callback: ((Error) -> Void)?) -> Builder {
            options.doOnError = callback
            return self
        }

        /// Show loading indicator. True by default
        public func showLoading(_ show: Bool) -> Builder {
            options.showLoading = show
            return self
        }

        /// Hide loading indicator. True by default
        public func hideLoading(_ hide: Bool) -> Builder {
            options.hideLoading = hide
            return self
        }

        /// Build the Object
        public func build() -> RequestOptions {
            options
        }
    }

    /// Default options
    public static func defaultOptions() -> RequestOptions {
        Builder().build()
    }

}