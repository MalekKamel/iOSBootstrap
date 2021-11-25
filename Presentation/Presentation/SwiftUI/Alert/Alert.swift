////
//// Created by Shaban on 17/05/2021.
//// Copyright (c) 2021 sha. All rights reserved.
////
//
//import UIKit
//
//class Alert: UIView {
//
//    func startLoading() {
//        DispatchQueue.main.async {
//            UIApplication.shared.mainWindow?.makeToastActivity(.center)
//        }
//    }
//
//    func stopLoading() {
//        DispatchQueue.main.async {
//            UIApplication.shared.mainWindow?.hideToastActivity()
//        }
//    }
//
//    func toast(message: String? = "", duration: TimeInterval = 2.0) {
//        #if DEVELOP
//        DispatchQueue.main.async {
//            UIApplication.shared.mainWindow?.makeToast(message, duration: duration, position: .center)
//        }
//        #endif
//    }
//
//    func showWithCancelButton(
//            with style: UIAlertController.Style,
//            in controller: UIViewController? = nil,
//            title: String?,
//            message: String,
//            confirmTitle: String = "Done",
//            buttonAction: @escaping () -> Void) {
//        let alertController = UIAlertController(title: title, message:
//        message, preferredStyle: style)
//
//        alertController.addAction(UIAlertAction(title: confirmTitle, style: .default, handler: { (action: UIAlertAction!) in
//            buttonAction()
//            alertController.dismiss(animated: true, completion: nil)
//        }))
//
//        present(controller: controller, with: alertController)
//
//    }
//
//    func showConfirmButtonsAndCancel(
//            with style: UIAlertController.Style,
//            in controller: UIViewController? = nil,
//            title: String?,
//            message: String?,
//            confirmTitle: String,
//            confirmedHandler: @escaping () -> (),
//            cancelTitle: String,
//            cancelHandler: @escaping () -> ()) {
//        let alertController = UIAlertController(title: title, message:
//        message, preferredStyle: style)
//
//        alertController.addAction(UIAlertAction(title: confirmTitle, style: .default, handler: { (action: UIAlertAction!) in
//            confirmedHandler()
//            alertController.dismiss(animated: true, completion: nil)
//        }))
//
//        alertController.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: { (action: UIAlertAction!) in
//            cancelHandler()
//            alertController.dismiss(animated: true, completion: nil)
//        }))
//
//
//        present(controller: controller, with: alertController)
//    }
//
//    func showTwoButtonsAndCancel(
//            with style: UIAlertController.Style,
//            in controller: UIViewController? = nil,
//            title: String?,
//            message: String?,
//            firstConfirmTitle: String,
//            secondConfirmTitle: String,
//            firstConfirmedAction: @escaping () -> (),
//            secondConfirmedAction: @escaping () -> (),
//            cancelTitle: String,
//            cancelAction: (() -> ())? = nil) {
//
//        let alertController = UIAlertController(title: title, message:
//        message, preferredStyle: style)
//
//        alertController.addAction(UIAlertAction(title: firstConfirmTitle, style: .default, handler: { (action: UIAlertAction!) in
//            firstConfirmedAction()
//            alertController.dismiss(animated: true, completion: nil)
//        }))
//
//        alertController.addAction(UIAlertAction(title: secondConfirmTitle, style: .default, handler: { (action: UIAlertAction!) in
//            secondConfirmedAction()
//            alertController.dismiss(animated: true, completion: nil)
//        }))
//
//        alertController.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: { (action: UIAlertAction!) in
//            cancelAction?()
//            alertController.dismiss(animated: true, completion: nil)
//        }))
//
//        present(controller: controller, with: alertController)
//    }
//
//    func showThreeButtonsAndCancel(
//            with style: UIAlertController.Style,
//            in controller: UIViewController? = nil,
//            title: String?,
//            message: String?,
//            firstConfirmTitle: String,
//            secondConfirmTitle: String,
//            thirdConfirmTitle: String,
//            firstConfirmedAction: @escaping () -> (),
//            secondConfirmedAction: @escaping () -> (),
//            thirdConfirmedAction: @escaping () -> (),
//            cancelTitle: String = "Cancel",
//            cancelAction: (() -> ())? = nil) {
//
//        let alertController = UIAlertController(title: title, message:
//        message, preferredStyle: style)
//
//        alertController.addAction(UIAlertAction(title: firstConfirmTitle, style: .default, handler: { (action: UIAlertAction!) in
//            firstConfirmedAction()
//            alertController.dismiss(animated: true, completion: nil)
//        }))
//
//        alertController.addAction(UIAlertAction(title: secondConfirmTitle, style: .default, handler: { (action: UIAlertAction!) in
//            secondConfirmedAction()
//            alertController.dismiss(animated: true, completion: nil)
//        }))
//
//        alertController.addAction(UIAlertAction(title: thirdConfirmTitle, style: .default, handler: { (action: UIAlertAction!) in
//            thirdConfirmedAction()
//            alertController.dismiss(animated: true, completion: nil)
//        }))
//
//        alertController.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: { (action: UIAlertAction!) in
//            cancelAction?()
//            alertController.dismiss(animated: true, completion: nil)
//        }))
//
//        present(controller: controller, with: alertController)
//    }
//
//    private func present(controller: UIViewController?, with alertController: UIAlertController) {
//        let rootController = controller ?? UIApplication.shared.topViewController()
//        alertController.popoverPresentationController?.sourceView = rootController?.view
//        alertController.popoverPresentationController?.sourceRect = rootController?.view.bounds ?? .zero
//        alertController.popoverPresentationController?.permittedArrowDirections = .up
//        rootController?.present(alertController, animated: true)
//    }
//
//    deinit {
//        stopLoading()
//    }
//}
