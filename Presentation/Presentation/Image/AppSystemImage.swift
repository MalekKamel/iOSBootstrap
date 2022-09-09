//
// Created by Shaban on 13/06/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import SwiftUI

public enum AppSystemImage: String {
    case houseFill = "house.fill"
    case cartFill = "cart.fill"
    case heartFill = "heart.fill"
    case gear = "gear"
    case chevronForward = "chevron.forward"
    case chevronBackward = "chevron.backward"
    case chevronDown = "chevron.down"
    case ellipsis = "ellipsis"
    case magnifyingGlass = "magnifyingglass"
    case checkmarkSquareFill = "checkmark.square.fill"
    case square = "square"
    case xMarkCircleFill = "xmark.circle.fill"
    case checkmarkCircleFill = "checkmark.circle.fill"
    case calendar = "calendar"
    case infoCircle = "info.circle"
    case infoCircleFill = "info.circle.fill"
    case info = "info"
    case arrowBackward = "arrow.backward"
    case trash = "trash"
    case trashFill = "trash.fill"
    case trashCircle = "trash.circle"
    case arrowForward = "arrow.forward"
    case checkmarkSealFill = "checkmark.seal.fill"
    case checkmark = "checkmark"
    case exclamationMarkTriangle = "exclamationmark.triangle"
    case phone = "phone"
    case phoneFill = "phone.fill"
    case phoneCircle = "phone.circle"
    case phoneBadgePlus = "phone.badge.plus"
    case phoneFillBadgePlus = "phone.fill.badge.plus"
    case phoneArrowUpRight = "phone.arrow.up.right"
    case phoneFillArrowUpRight = "phone.fill.arrow.up.right"
    case phoneArrowDownLeft = "phone.arrow.down.left"
    case bellFill = "bell.fill"
    case arrowLeftSquareFill = "arrow.left.square.fill"
    case arrowRightSquareFill = "arrow.right.square.fill"
    case squareAndPencil = "square.and.pencil"
    case envelope = "envelope"
    case globe = "globe"
}

public extension Image {
    init(systemName: AppSystemImage) {
        self.init(systemName: systemName.rawValue)
    }
}
