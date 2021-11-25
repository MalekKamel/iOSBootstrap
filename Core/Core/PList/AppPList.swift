//
// Created by Shaban Kamel on 02/02/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation

public struct AppPList {
    public static func value(
            of key: BuildConfigName,
            bundle: Bundle = Bundle.main
    ) -> String {
        bundle.infoDictionary?[key.rawValue] as? String ?? ""
    }
}
