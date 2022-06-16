//
// Created by Shaban Kamel on 03/09/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import Foundation

public enum BuildConfig {
    case debug
    case testing
    case release
    case staging

    public static let current: BuildConfig = {
        guard let rawValue = Bundle.main.infoDictionary?["BuildConfig"] as? String else {
            fatalError("No Configuration Found")
        }

        switch rawValue.lowercased() {
        case "debug":
            return .debug
        case "testing":
            return .testing
        case "staging":
            return .staging
        case "release":
            return .release
        default:
            return .release
        }
    }()

    public static func isDebug() -> Bool {
        current == .debug
    }

    public static func isNotDebug() -> Bool {
        !isDebug()
    }

    public static func isTesting() -> Bool {
        current == .testing
    }

    public static func isNotTesting() -> Bool {
        !isTesting()
    }

    public static func isStaging() -> Bool {
        current == .staging
    }

    public static func isNotStaging() -> Bool {
        !isStaging()
    }

    public static func isRelease() -> Bool {
        current == .release
    }

    public static func isNotRelease() -> Bool {
        !isRelease()
    }

}
