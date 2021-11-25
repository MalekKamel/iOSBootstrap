//
// Created by Shaban Kamel on 22/11/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import Foundation


public struct AppResponse<T: Codable>: Codable {
    public let code: Int
    public let message: String
    public let result: T?
}