//
// Created by Shaban on 18/05/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import Moya

extension MoyaProvider {

    static func create<Target: TargetType>() -> MoyaProvider<Target> {
        var config = NetworkLoggerPlugin.Configuration()

        // Log Options
        var logOptions = NetworkLoggerPlugin.Configuration.LogOptions()
        logOptions.insert(NetworkLoggerPlugin.Configuration.LogOptions.verbose)
        config.logOptions = logOptions

        // Formatter
        config.formatter = NetworkLoggerPlugin.Configuration.Formatter(responseData: jsonResponseDataFormatter)

        let logger = NetworkLoggerPlugin(configuration: config)

        return MoyaProvider<Target>(stubClosure: MoyaProvider<Target>.delayedStub(0.1), plugins: [logger])
    }

    private static func jsonResponseDataFormatter(_ data: Data) -> String {
        do {
            let dataAsJSON = try JSONSerialization.jsonObject(with: data)
            let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
            return String(decoding: prettyData, as: UTF8.self)
        } catch {
            return String(decoding: data, as: UTF8.self)
        }
    }
}



