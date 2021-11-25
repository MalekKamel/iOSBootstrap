//Copyright HitchHiker© 2017. All rights reserved.

import UIKit
import SwiftMessages

protocol Reportable {

    func showSuccess(
            title: String?,
            message: String?,
            actionTitle: String?,
            actionBlock: (() -> Void)?
    )

    func showError(
            title: String?,
            message: String?,
            actionTitle: String?,
            actionBlock: (() -> Void)?
    )

    func showInfo(
            title: String?,
            message: String?,
            actionTitle: String?,
            actionBlock: (() -> Void)?
    )

    func show(_ error: NSError)

}

extension Reportable {

    func showSuccess(
            title: String? = nil,
            message: String?,
            actionTitle: String? = nil,
            actionBlock: (() -> Void)? = nil
    ) {
        showSwiftMessage(
                title: title,
                message: message,
                layout: .tabView,
                theme: .success,
                feedbackType: .success
        )
    }

    func show(_ error: NSError) {
        UINotificationFeedbackGenerator().notificationOccurred(.error)

        CrashlyticsUtil.record(
                error: error,
                description: error.localizedDescription,
                failure: error.localizedFailureReason ?? ""
        )

        showError(
                title: error.localizedDescription,
                message: error.localizedFailureReason
        )
    }

    func showError(
            title: String? = nil,
            message: String?,
            actionTitle: String? = nil,
            actionBlock: (() -> Void)? = nil
    ) {
        CrashlyticsUtil.record(description: title, failure: message)

        //Handle strings from the backend with \\
        let filteredTitle =
                title?.replacingOccurrences(
                                of: "\\r", with: "\r")
                        .replacingOccurrences(of: "\\n", with: "\n")

        let filteredMessage = message?
                .replacingOccurrences(of: "\\r", with: "\r")
                .replacingOccurrences(of: "\\n", with: "\n")

        showSwiftMessage(
                title: filteredTitle,
                message: filteredMessage,
                actionTitle: actionTitle,
                actionBlock: actionBlock,
                layout: .tabView,
                theme: .error,
                feedbackType: .error
        )
    }

    func showInfo(
            title: String? = nil,
            message: String?,
            actionTitle: String? = nil,
            actionBlock: (() -> Void)? = nil
    ) {
        showSwiftMessage(
                title: title,
                message: message,
                actionTitle: actionTitle,
                actionBlock: actionBlock,
                layout: .tabView,
                theme: .warning,
                feedbackType: .warning
        )
    }
}

fileprivate func showSwiftMessage(
        title: String? = nil,
        message: String?,
        actionTitle: String? = nil,
        actionBlock: (() -> Void)? = nil,
        layout: MessageView.Layout,
        theme: Theme,
        feedbackType: UINotificationFeedbackGenerator.FeedbackType
) {
    DispatchQueue.main.async {

        UINotificationFeedbackGenerator().notificationOccurred(feedbackType)

        let view = MessageView.viewFromNib(layout: layout)
        view.configureTheme(theme)
        view.configureDropShadow()

        if actionTitle == nil { view.button?.isHidden = true }
        if title == nil { view.titleLabel?.isHidden = true }

        view.configureContent(
                title: title,
                body: message,
                iconImage: nil,
                iconText: nil,
                buttonImage: nil,
                buttonTitle: actionTitle
        ) { _ in
            SwiftMessages.hide()
            actionBlock?()
        }

        var config: SwiftMessages.Config {
            var config = SwiftMessages.Config.init()
            config.duration = .seconds(seconds: 6)
            config.ignoreDuplicates = true
            config.dimMode = .gray(interactive: true)
            return config
        }

        SwiftMessages.show(config: config, view: view)
    }
}
