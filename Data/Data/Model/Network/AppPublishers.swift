//
// Created by Shaban on 18/05/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import Combine

public typealias DecodePublisher<T: Decodable> = AnyPublisher<T, AppError>
public typealias AppPublisher<T> = AnyPublisher<T, AppError>
