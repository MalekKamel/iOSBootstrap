//
// Created by mac on 2019-07-29.
// Copyright (c) 2019 sulfa. All rights reserved.
//

import UIKit
import Photos
import Core

open class ImagePicker: NSObject {
    private let pickerController: UIImagePickerController
    private var onImageSelected: ((UIImage?) -> Void)? = nil

    public override init() {
        pickerController = UIImagePickerController()

        super.init()

        pickerController.delegate = self
        pickerController.allowsEditing = true
        pickerController.mediaTypes = ["public.image"]
    }

    private func action(for type: UIImagePickerController.SourceType, title: String, controller: UIViewController) -> UIAlertAction? {
        guard UIImagePickerController.isSourceTypeAvailable(type) else {
            return nil
        }

        return UIAlertAction(title: title, style: .default) { [unowned self] _ in
            pickerController.sourceType = type
            controller.present(pickerController, animated: true)
        }
    }

    public func present(controller: UIViewController, from sourceView: UIView? = nil, onImageSelected: ((UIImage?) -> Void)?) {
        self.onImageSelected = onImageSelected
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        setupActions(alertController: alertController, controller: controller)
        alertController.addAction(UIAlertAction(title: L10n.cancel, style: .cancel, handler: nil))
        setupIPad(view: sourceView, alertController: alertController)
        controller.present(alertController, animated: true)
    }

    private func setupActions(alertController: UIAlertController, controller: UIViewController) {
        if let action = action(for: .camera, title: L10n.takePhoto, controller: controller) {
            alertController.addAction(action)
        }
        if let action = action(for: .savedPhotosAlbum, title: L10n.savedPhotos, controller: controller) {
            alertController.addAction(action)
        }
        if let action = action(for: .photoLibrary, title: L10n.photoLibrary, controller: controller) {
            alertController.addAction(action)
        }
    }

    private func setupIPad(view: UIView?, alertController: UIAlertController) {
        guard let view = view, UIDevice.current.userInterfaceIdiom == .pad else {
            return
        }
        alertController.popoverPresentationController?.sourceView = view
        alertController.popoverPresentationController?.sourceRect = view.bounds
        alertController.popoverPresentationController?.permittedArrowDirections = [.down, .up]
    }

    private func pickerController(_ controller: UIImagePickerController, didSelect image: UIImage?) {
        controller.dismiss(animated: true, completion: nil)
        onImageSelected?(image)
    }
}

extension ImagePicker: UIImagePickerControllerDelegate {

    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.pickerController(picker, didSelect: nil)
    }

    public func imagePickerController(_ picker: UIImagePickerController,
                                      didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            return self.pickerController(picker, didSelect: nil)
        }

        self.pickerController(picker, didSelect: image)
    }
}

extension ImagePicker: UINavigationControllerDelegate {

}