//
// Created by Shaban on 18/05/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import Moya

protocol MoyaTargetType: TargetType {

}

extension MoyaTargetType {
    public var baseURL: URL {
        URL(string: "https://www.google/com")!
    }

    public var validationType: ValidationType {
        .none
    }

    public var sampleData: Data {
        Data()
    }

    public var headers: [String: String]? {
        [
            "Authorization:": "Bearer ",
            "Content-Type": "application/json"
        ]
    }

    var parameters: [String: Any]? {
        nil
    }

}