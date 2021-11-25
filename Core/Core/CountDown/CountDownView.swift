//
//  TimeDownCounter.swift
//  Chauffeur
//
//  Created by Shaban Kamel on 01/09/2021.
//  Copyright © 2021 sha. All rights reserved.
//

import SwiftUI
import Combine


public struct CountDownView: View {
    @AppStateObject var vm = CountDownVM()
    private let onFinish: () -> Void
    @Binding private var isActive: Bool
    private let type: CountDownTimer.CountType

    public init(
            isActive: Binding<Bool>,
            type: CountDownTimer.CountType,
            onFinish: @escaping () -> Void = {
            }
    ) {
        _isActive = isActive
        self.type = type
        self.onFinish = onFinish
    }

    public var body: some View {
        Text(vm.timeout)
                .font(.system(size: 14))
                .bold()
                .foregroundColor(.black)
                .onValueChange(of: isActive) { value in
                    if value {
                        vm.startTimer(type: type) {
                            isActive = false
                        }
                        return
                    }
                    vm.cancelTimer()
                }
    }

    public func startTimer() {
        isActive = true
    }

}


class CountDownVM: ObservableObject {
    @Published var timeout: String = ""
    private lazy var countDownTimer: CountDownTimer! = {
        CountDownTimer(
                onTick: { [weak self]  output, _, _, _ in
                    guard let self = self else {
                        return
                    }
                    guard output != "00:00" else {
                        self.cancelTimer()
                        return
                    }
                    self.timeout = output
                },
                onFinish: { [weak self] _, _ in
                    guard let self = self else {
                        return
                    }
                    self.timeout = ""
                    self.onFinish()
                })
    }()
    private var onFinish: () -> Void = {
    }

    func startTimer(
            type: CountDownTimer.CountType,
            onFinish: @escaping () -> Void
    ) {
        switch type {
        case .up:
            break
        case .down(let date):
            self.onFinish = onFinish
            let date = date
            countDownTimer.start(eventDate: date, type: type)
        }
    }

    func cancelTimer() {
        timeout = ""
        countDownTimer.cancel()
    }
}

