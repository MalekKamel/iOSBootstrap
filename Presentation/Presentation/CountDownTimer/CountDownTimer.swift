//
// Created by Shaban on 18/07/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import Foundation


public class CountDownTimer {
    public typealias OnTick = ((_ output: String, _ timeLeft: DateComponents, _ currentDate: Date, _ eventDate: Date) -> Void)?
    public typealias OnFinish = ((_ currentDate: Date, _ eventDate: Date) -> Void)?

    let onTick: OnTick
    let onFinish: OnFinish
    private var timer: Timer? = nil
    private var eventDate: Date!
    private let outputFormat = OutputFormat.minuteSecond

    public enum OutputFormat {
        case minuteSecond
        case custom(String)
    }

    public init(onTick: OnTick, onFinish: OnFinish, outputFormat: OutputFormat = .minuteSecond) {
        self.onTick = onTick
        self.onFinish = onFinish
    }


    public func start(eventDate: Date, type: CountType) {
        self.eventDate = eventDate
        start(type: type)
    }

    private func start(type: CountType) {
        switch type {
        case .up:
            break
        case .down:
            timer = Timer.scheduledTimer(
                    timeInterval: 0.1,
                    target: self,
                    selector: #selector(updateTime),
                    userInfo: nil,
                    repeats: true
            )
        }

    }

    @objc func updateTime() {
        let userCalendar = Calendar.current

        // Set Current Date
        let date = Date()
        let components = userCalendar.dateComponents([.hour, .minute, .month, .year, .day, .second], from: date)
        let currentDate = userCalendar.date(from: components)!

        // Change the date to days, hours, minutes and seconds
        let timeLeft = userCalendar.dateComponents([.day, .hour, .minute, .second], from: currentDate, to: eventDate)
        let dateLeft = userCalendar.date(from: timeLeft)!

        let df = DateFormatter()
        switch outputFormat {
        case .minuteSecond:
            df.dateFormat = "mm:ss"
        case .custom(let format):
            df.dateFormat = format
        }
        let output = df.string(from: dateLeft)

        onTick?(output, timeLeft, currentDate, eventDate)

        // finish timer if needed
        if currentDate >= eventDate {
            timer?.invalidate()
            onFinish?(currentDate, eventDate)
        }
    }

    public func cancel() {
        timer?.invalidate()
    }
}

extension CountDownTimer {

    public enum CountType {
        case up
        case down(Date)
    }

}