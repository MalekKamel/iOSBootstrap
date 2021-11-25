//
//  PassCodeInputModel.swift
//  PassCodeInputDemo
//
//  Created by Shaban Kamel on 4/5/20.
//  Copyright © 2020 Anomaly Software. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

public class PinViewModel: ObservableObject {
    @Published var passCode: [String]
    @Published var isValid: Bool = false

    @Published var selectedCellIndex: Int {
        didSet {
            if selectedCellIndex >= numberOfCells {
                selectedCellIndex = oldValue
            }
        }
    }

    private var cancellableSet: Set<AnyCancellable> = []
    private var passCodeValidPublisher: AnyPublisher<Bool, Never> {
        $passCode
                .removeDuplicates()
                .map {
                    $0.allSatisfy {
                        $0.count == 1
                    }
                }
                .eraseToAnyPublisher()
    }

    /**
     - Returns: The number of cells in the pass code
     */
    public var numberOfCells: Int {
        get {
            passCode.count
        }
    }

    /**
     - Returns: A String with the current entered code
     */
    public var code: String {
        get {
            passCode.joined()
        }
    }

    /**
     - Parameters passCodeLength: Number of characters in passcode. Must be greater than 0.
     */
    public init(passCodeLength: UInt) {
        passCode = Array()
        selectedCellIndex = 0

        for _ in 0..<passCodeLength {
            passCode.append("")
        }

        passCodeValidPublisher
                .receive(on: RunLoop.main)
                .assign(to: \.isValid, on: self)
                .store(in: &cancellableSet)

    }
}
