//
// Created by Shaban on 09/09/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import Foundation

public func onMainThread(_ callback: @escaping () -> Void) {
    DispatchQueue.main.async(execute: callback)
}