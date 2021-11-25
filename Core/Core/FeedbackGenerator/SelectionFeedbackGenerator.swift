//
// Created by mac on 2019-03-24.
// Copyright (c) 2019 A. All rights reserved.
//

import UIKit

/**
 * A 3D Touch selection feedback generator wrapper that uses the API only when available.
 */

public class SelectionFeedbackGenerator {

    private let anyObject: AnyObject?

    public init() {

        if #available(iOS 10, *) {
            anyObject = UISelectionFeedbackGenerator()
        } else {
            anyObject = nil
        }

    }

    public func prepare() {

        if #available(iOS 10, *) {
            (anyObject as! UISelectionFeedbackGenerator).prepare()
        }

    }

   public func selectionChanged() {

        if #available(iOS 10, *) {
            (anyObject as! UISelectionFeedbackGenerator).selectionChanged()
        }

    }

}

/**
 * A 3D Touch success feedback generator wrapper that uses the API only when available.
 */

public class SuccessFeedbackGenerator {

    private let anyObject: AnyObject?

    init() {

        if #available(iOS 10, *) {
            anyObject = UINotificationFeedbackGenerator()
        } else {
            anyObject = nil
        }

    }

   public func prepare() {

        if #available(iOS 10, *) {
            (anyObject as! UINotificationFeedbackGenerator).prepare()
        }

    }

   public func success() {

        if #available(iOS 10, *) {
            (anyObject as! UINotificationFeedbackGenerator).notificationOccurred(.success)
        }

    }

}
