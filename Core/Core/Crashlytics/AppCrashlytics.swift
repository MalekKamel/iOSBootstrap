//
// Created by Shaban on 25/06/2021.
//

import Foundation

public class AppCrashlytics {

    public class func record(
            error: Error? = nil,
            description: String? = nil,
            failure: String? = nil
    ) {

        let err: Error = error ?? NSError(
                domain: "Internal client error",
                code: 100,
                userInfo: nil
        )

        print(err)

        // TODO: integrate crashlytics
/*
    Crashlytics.sharedInstance().recordError(
                err,
                withAdditionalUserInfo: ["Description": description ?? "", "Failure": failure ?? ""]
        )
*/
    }


}