//
//  Week5_Assignmen2.swift
//  GDG-WeeklyiOS-2dubu
//
//  Created by 이건우 on 11/12/24.
//

import SwiftUI

struct Week5_Assignment2: View {
    @State private var timeRemaining: Int = 10
    @State private var progress: CGFloat = 1.0
    @State private var isRunning: Bool = false

    private let totalTime: Int = 10
    private let progressBarWidth: CGFloat = UIScreen.main.bounds.width - 40
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack(spacing: 30) {
            TimerHeaderView(timeRemaining: timeRemaining)
            
            ProgressBarView(progress: progress, width: progressBarWidth)

            StartButton(isRunning: isRunning, progress: progress, action: startCountdown)
                
            Spacer()
                .frame(height: 50)
        }
        .onReceive(timer) { _ in
            updateCountdown()
        }
    }
}

private extension Week5_Assignment2 {
    private func startCountdown() {
        withTransaction(Transaction(animation: nil)) {
            timeRemaining = totalTime
        }
        progress = 1.0
        isRunning = true
    }
    
    private func updateCountdown() {
        if isRunning && timeRemaining > 0 {
            timeRemaining -= 1
            progress = CGFloat(timeRemaining) / CGFloat(totalTime)
        } else if timeRemaining == 0 {
            isRunning = false
        }
    }
}

// MARK: - Timer Header View
fileprivate struct TimerHeaderView: View {
    let timeRemaining: Int

    var body: some View {
        VStack(spacing: 15) {
            Text("Countdown Timer")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)

            Text("\(timeRemaining) seconds")
                .font(.system(size: 30, weight: .light))
                .foregroundColor(.white)
        }
    }
}

// MARK: - Progress Bar View
fileprivate struct ProgressBarView: View {
    let progress: CGFloat
    let width: CGFloat

    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.2))
                .frame(height: 20)

            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(
                    gradient: Gradient(colors: [.blue, .purple]),
                    startPoint: .leading,
                    endPoint: .trailing
                ))
                .frame(width: progress * width, height: 20)
                .animation(.linear(duration: 1), value: progress)
        }
        .frame(width: width)
    }
}

// MARK: - Start Button View
fileprivate struct StartButton: View {
    let isRunning: Bool
    let progress: CGFloat
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .stroke(.white, lineWidth: 2)
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [.blue, .purple]),
                        startPoint: .top,
                        endPoint: .bottom
                    ))
                    .frame(width: 80, height: 80)
                    

                Text(progress == 0 ? "Restart" : "Start")
                    .font(.headline)
                    .foregroundColor(.white)
            }
        }
        .disabled(isRunning)
        .opacity(isRunning ? 0.5 : 1.0)
    }
}

#Preview {
    Week5_Assignment2()
}
