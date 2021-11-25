//
// Created by Shaban Kamel on 13/04/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation

public extension Int {

    var seconds: DispatchTimeInterval { DispatchTimeInterval.seconds(self) }

    var second: DispatchTimeInterval { seconds }

    var milliseconds: DispatchTimeInterval { DispatchTimeInterval.milliseconds(self) }

    var millisecond: DispatchTimeInterval { DispatchTimeInterval.milliseconds(self) }

}

public extension DispatchTimeInterval {
    var fromNow: DispatchTime {
        DispatchTime.now() + self
    }
}