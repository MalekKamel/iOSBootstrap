//Copyright HitchHiker© 2017. All rights reserved.

import UIKit
import BLTNBoard

protocol Alertable {

    typealias AlertAction = UIAlertAction

    func showAlert(
            title: String?,
            message: String?,
            actions: [AlertAction]
    )

    func showActionSheet(
            title: String?,
            message: String?,
            actions: [AlertAction]
    )

    func showAlertWithInputField(
            title: String?,
            message: String?,
            actionTitle: String?,
            keyboardType: UIKeyboardType,
            placeholder: String?,
            callback: @escaping (String?) -> Void)

    func showBulletin(
            title: String,
            description: String,
            image: UIImage,
            actions: [ButtetinAction]
    )
}

private var bulletinManager: BLTNItemManager?

extension Alertable{

    func showAlert(
            title: String?,
            message: String?,
            actions: [AlertAction]
    ) {
        showAlertController(
                title: title,
                message: message,
                actions: actions,
                preferredStyle: .alert
        )
    }

    func showActionSheet(
            title: String? = nil,
            message: String?,
            actions: [AlertAction]
    ) {
        showAlertController(
                title: title,
                message: message,
                actions: actions,
                preferredStyle: .actionSheet
        )
    }

    func showAlertWithInputField(
            title: String?,
            message: String?,
            actionTitle: String?,
            keyboardType: UIKeyboardType,
            placeholder: String?,
            callback: @escaping (String?) -> Void
    ) {
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        let alertController = UIAlertController(
                title: title,
                message: message,
                preferredStyle: .alert
        )
        alertController.addTextField { $0.placeholder = placeholder }
        alertController.textFields?.first?.keyboardType = keyboardType

        let cancelAction = UIAlertAction(
                title: L10n.cancel,
                style: .destructive, handler: nil
        )
        let saveAction = UIAlertAction(
                title: actionTitle,
                style: .default,
                handler: { _ in
                    guard let firstTextField = alertController.textFields?[0] else { return }
                    callback(firstTextField.text)
                })
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        rootViewController.present(alertController, animated: true, completion: nil)
    }

    func showBulletin(
            title: String,
            description: String,
            image: UIImage,
            actions: [ButtetinAction]
    ) {
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()

        let page = ActionsBulletin(
                title: title,
                image: image,
                description: description,
                actions: actions
        )

        page.dismissalHandler = { _ in
            bulletinManager = nil
        }

        bulletinManager = BLTNItemManager(rootItem: page)
        bulletinManager?.backgroundViewStyle = .dimmed
        bulletinManager?.showBulletin(
                above: RootViewController.topPresentedViewController,
                animated: true,
                completion: nil
        )
    }

    private func showAlertController(
            title: String?,
            message: String?,
            actions: [AlertAction],
            preferredStyle: UIAlertController.Style
    ) {
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        let alertController = UIAlertController(
                title: title,
                message: message,
                preferredStyle: preferredStyle
        )
        actions.forEach { alertController.addAction($0) }
        rootViewController.present(
                alertController,
                animated: true,
                completion: nil
        )
    }

}
