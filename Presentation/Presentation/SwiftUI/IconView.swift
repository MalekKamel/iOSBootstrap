//
// Created by Apple on 12/02/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import SwiftUI

public struct IconView: View {
    var icon: String
    var iconType: IconType = .normal
    var iconColor: Color?
    var iconWidth: CGFloat? = nil
    var iconHeight: CGFloat? = nil

    public init(icon: String,
                iconType: IconType = .normal,
                iconColor: Color? = nil,
                iconWidth: CGFloat? = nil,
                iconHeight: CGFloat? = nil) {
        self.icon = icon
        self.iconType = iconType
        self.iconColor = iconColor
        self.iconWidth = iconWidth
        self.iconHeight = iconHeight
    }

    public var body: some View {
        switch iconType {
        case .normal:
            Image(icon)
                    .resizable()
                    .foregroundColor(iconColor)
                    .frame(width: iconWidth, height: iconHeight)
        case .system:
            Image(systemName: icon)
                    .resizable()
                    .foregroundColor(iconColor)
                    .frame(width: iconWidth, height: iconHeight)
        }

    }
}

public enum IconType {
    case normal
    case system
}

struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView(
                icon: Assets.icBack.name,
                iconWidth: 30,
                iconHeight: 30
        )
    }
}
