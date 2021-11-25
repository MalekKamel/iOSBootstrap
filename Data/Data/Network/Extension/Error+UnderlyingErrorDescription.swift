//
// Created by Shaban on 04/09/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import Foundation

public extension Swift.Error {

    var underlyingErrorDescription: String {
       apiErrorMessage ?? localizedDescription
    }

}
