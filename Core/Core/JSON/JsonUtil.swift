//
// Created by mac on 2019-04-15.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation

public func serializeToData(jsonObject: Any) -> Data? {
    do {
        guard JSONSerialization.isValidJSONObject(jsonObject) else {
            return nil
        }
        return try JSONSerialization.data(withJSONObject: jsonObject)
    } catch let err{
//        genericError(error: err)
        return nil
    }
}
