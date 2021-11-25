//
// Created by Shaban on 21/07/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import SwiftUI

public struct ImagePickerButton: View {
    @Binding var selectedImage: UIImage?
    private let imagePicker: ImagePicker = ImagePicker()

    public init(selectedImage: Binding<UIImage?>) {
        self._selectedImage = selectedImage
    }

    public var body: some View {
        Button(action: {
            imagePicker.present(controller: viewController!) { image in
                selectedImage = image
            }
        }) {
            Group {
                Image(Assets.sandwich.name)
                        .resizable()
                        .frame(width: 45, height: 45)
            }
                    .frame(width: 100, height: 100)
            .background(Color(Colors.grayBackground.name))
                    .cornerRadius(10)
        }
    }
}

struct ImagePickerButton_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerButton(selectedImage: .constant(nil))
    }
}
