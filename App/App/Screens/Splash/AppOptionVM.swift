//
// Created by Shaban Kamel on 25/08/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import Foundation

class AppOptionVM: AppViewModel {
    @Published public var loadState: LoadingState = .init()
    public var bag = CancelableBag()
    public var dataManager: DataManagerContract
    public var requester: CombineRequester

    init(dataManager: DataManagerContract, requester: CombineRequester) {
        self.dataManager = dataManager
        self.requester = requester
    }

}