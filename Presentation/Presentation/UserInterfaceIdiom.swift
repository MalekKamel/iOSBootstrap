//
// Created by Shaban on 19/05/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import UIKit

public enum UserInterfaceIdiom {
    case iPhone
    case iPad
}

public class UserInterface {

    public static func idiom() -> UserInterfaceIdiom {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone,
             .unspecified:
            return .iPhone
        case .pad,
             .tv,
             .carPlay,
             .mac:
            return .iPad

        @unknown default:
            return .iPhone
        }
    }

    public static func isIpad() -> Bool {
        idiom() == .iPad
    }

    public static func isIPhone() -> Bool {
        idiom() == .iPhone
    }
}

/*

 switch UserInterface.idiom() {
                case .iPhone:

                case .iPad:

                }

UserInterface.isIPhone()

 */