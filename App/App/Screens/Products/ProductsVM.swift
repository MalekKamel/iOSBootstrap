//
// Created by Shaban Kamel on 07/01/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import Foundation

class ProductsVM: AppViewModel {
    public var dataManager: DataManagerContract
    public var requester: AsyncMan

    public init(dataManager: DataManagerContract, requester: AsyncMan) {
        self.dataManager = dataManager
        self.requester = requester
    }
}