//
// Created by Shaban on 10/07/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import Combine
import Data

public protocol ResumableHandler {
    func canHandle(error: Swift.Error) -> Bool
    func handle(error: Swift.Error, presentable: Presentable?) -> AnyPublisher<Any, AppError>
}