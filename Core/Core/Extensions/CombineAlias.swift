//
// Created by Shaban on 22/05/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import Combine

public typealias Relay<T> = CurrentValueSubject<T, Never>
public typealias NeverSubject<T> = PassthroughSubject<T, Never>
public typealias NeverPublisher<T> = AnyPublisher<T, Never>
public typealias Drive<T> = Published<T>.Publisher
public typealias CancelableBag = Set<AnyCancellable>
