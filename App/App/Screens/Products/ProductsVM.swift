//
// Created by Shaban Kamel on 07/01/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import Foundation

class ProductsVM: AppViewModel {
    public var dataManager: DataManagerContract
    @Published public var loadState: LoadingState = .init()
    public var bag = CancelableBag()
    public var requester: CombineRequester

    public init(dataManager: DataManagerContract, requester: CombineRequester) {
        self.dataManager = dataManager
        self.requester = requester
    }
}