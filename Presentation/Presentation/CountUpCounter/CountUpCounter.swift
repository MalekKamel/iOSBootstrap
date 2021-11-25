//
//  CapsuleProgressBarWithTimerLogic.swift
//  ChoufearApp
//
//  Created by Shaban Kamel on 26/09/2021.
// https://marcgg.com/blog/2020/05/06/circular-progressbar-clock-swiftui/
// https://stackoverflow.com/questions/64578504/creating-a-capsule-style-progress-in-swiftui
// https://medium.com/geekculture/build-a-stopwatch-in-just-3-steps-using-swiftui-778c327d214b
// https://gitlab.com/appsbymw/count-up-timer/-/blob/master/count-up-timer/count-up-timer/ContentView.swift


import SwiftUI

public struct CountUpCounter: View {

    public init() {

    }

    @State var hours: Int = 0
    @State var minutes: Int = 0
    @State var seconds: Int = 0
    @State var timerIsPaused: Bool = true


    @State var timer: Timer? = nil

    @State var counter: Int = 0

    @State private var finishRound: Bool = false

    var countTo: Int = 59

    public var body: some View {
        VStack {
            ZStack {
                ProgressTrack()
                ProgressBar(counter: seconds, countTo: countTo)
                Text("\(minutes):\(seconds)")
                        .foregroundColor(Colors.darkIndigo.swiftUiColor)
                        .font(FontFamily.HelveticaNeue.condensedBlack.swiftUiFont(size: 16))

            }
        }.onAppear {
            startTimer()
        }
    }

    public func startTimer() {
        timerIsPaused = false
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { tempTimer in
            if seconds == 59 {
                self.seconds = 0
                if minutes == 59 {
                    self.minutes = 0
                    self.hours = hours + 1
                } else {
                    self.minutes = minutes + 1
                }
            } else {
                self.seconds = seconds + 1
            }
        }
    }
}


