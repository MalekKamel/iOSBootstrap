//
// Created by Shaban on 09/06/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import Alamofire

public class NetworkState {

    public class var isConnected: Bool {
        NetworkReachabilityManager(host: "www.google.com")!.isReachable
    }

    public class var isCellular: Bool {
        NetworkReachabilityManager(host: "www.google.com")!.isReachableOnCellular
    }

}
