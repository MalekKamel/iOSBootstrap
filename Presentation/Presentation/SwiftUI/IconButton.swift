//
// Created by Apple on 12/02/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import SwiftUI

public struct IconButton: View {
    let icon: String
    var iconType: IconType
    var iconColor: Color?
    var iconWidth: CGFloat = 60
    var iconHeight: CGFloat = 60
    var title: String = ""
    var direction: Axis.Set = .horizontal
    var action: () -> Void

    public init(icon: String,
                iconType: IconType = .normal,
                iconColor: Color? = nil,
                iconWidth: CGFloat = 60,
                iconHeight: CGFloat = 60,
                title: String = "",
                direction: Axis.Set = .horizontal,
                action: @escaping () -> ()) {
        self.icon = icon
        self.iconType = iconType
        self.iconColor = iconColor
        self.iconWidth = iconWidth
        self.iconHeight = iconHeight
        self.title = title
        self.direction = direction
        self.action = action
    }

    public var body: some View {
        Button(action: {
            action()
        }) {
            Group {
                switch direction {
                case .horizontal:
                    HStack(alignment: .center, spacing: 8) {
                        ButtonView().frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                case .vertical:
                    VStack(alignment: .center, spacing: 8) {
                        ButtonView().frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                default:
                    EmptyView()
                }
            }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
        }.contentShape(Rectangle())
    }

    private func ButtonView() -> some View {
        Group {
            IconView(
                    icon: icon,
                    iconType: iconType,
                    iconColor: iconColor,
                    iconWidth: iconWidth,
                    iconHeight: iconHeight
            ).frame(width: iconWidth, height: iconHeight)
                    .padding()

            if !title.isEmpty {
                Text(title)
                        .fontWeight(.semibold)
                        .font(.system(size: 12))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }

}

struct IconButton_Previews: PreviewProvider {
    static var previews: some View {
        IconButton(
                icon: Assets.icBack.name,
                iconWidth: 30,
                iconHeight: 30
        ) {

        }
    }
}
