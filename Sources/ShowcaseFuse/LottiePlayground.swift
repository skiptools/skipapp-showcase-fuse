// Copyright 2023–2025 Skip
import Foundation
import SwiftUI
import SkipMotion

/// This component uses the `SkipMotion` module from https://source.skip.tools/skip-motion
struct LottiePlayground: View {
    @State internal var isPlaying = true
    @State internal var loopMode: MotionLoopMode = .loop
    @State internal var speed: Double = 1.0

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Controls
                VStack(spacing: 12) {
                    Toggle("Playing", isOn: $isPlaying)

                    Picker("Loop Mode", selection: $loopMode) {
                        Text("Play Once").tag(MotionLoopMode.playOnce)
                        Text("Loop").tag(MotionLoopMode.loop)
                        Text("Auto Reverse").tag(MotionLoopMode.autoReverse)
                        Text("Repeat 3x").tag(MotionLoopMode.repeat(3))
                    }
                    .pickerStyle(.segmented)

                    HStack {
                        Text("Speed: \(speed, specifier: "%.1f")x")
                        Slider(value: $speed, in: 0.1...3.0, step: 0.1)
                    }
                }
                .padding()
                .background(Color.secondary.opacity(0.1))
                .cornerRadius(12)
                .padding(.horizontal)

                // Animation grid
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                    ForEach(lottieFiles, id: \.name) { lottie in
                        MotionView(lottie: lottie.container, animationSpeed: speed, loopMode: loopMode, isPlaying: isPlaying)
                            .frame(height: 100.0)
                    }
                }
                .padding()
            }
        }
    }
}

let lottieFiles: [(name: String, container: LottieContainer)] = [
    "lottie-loader-01.json",
    "lottie-loader-02.json",
    "lottie-loader-03.json",
    "lottie-loader-04.json",
    "lottie-loader-05.json",
    "lottie-loader-06.json",
    "lottie-loader-07.json",
    "lottie-loader-08.json",
    "lottie-loader-09.json",
    "lottie-loader-10.json",
    "lottie-loader-11.json",
    "lottie-loader-12.json",
    "lottie-loader-13.json",
    "lottie-loader-14.json",
    "lottie-loader-15.json",
    "lottie-loader-16.json",
    "lottie-loader-17.json",
    "lottie-loader-18.json",
    "lottie-loader-19.json",
    "lottie-loader-20.json",
    "lottie-loader-21.json",
    "lottie-loader-22.json",
].map {
    ($0, try! LottieContainer(data: Data(contentsOf: Bundle.module.url(forResource: $0, withExtension: nil)!)))
}
