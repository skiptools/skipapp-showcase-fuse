// Copyright 2023–2025 Skip
import Foundation
import SwiftUI
import SkipMotion

/// This component uses the `SkipMotion` module from https://source.skip.tools/skip-motion
struct LottiePlayground: View {
    @State internal var isPlaying = true
    @State internal var loopMode: MotionLoopMode = .loop
    @State internal var speed: Double = 1.0
    @State internal var contentMode: MotionContentMode = .fit
    @State internal var scrubProgress: Double = 0.5
    @State internal var isScrubbing: Bool = false
    @State internal var useClipSpec: Bool = false
    @State internal var clipFrom: Double = 0.0
    @State internal var clipTo: Double = 0.5

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

                    Picker("Content Mode", selection: $contentMode) {
                        Text("Fit").tag(MotionContentMode.fit)
                        Text("Fill").tag(MotionContentMode.fill)
                    }
                    .pickerStyle(.segmented)

                    HStack {
                        Text("Speed: \(speed, specifier: "%.1f")x")
                        Slider(value: $speed, in: 0.1...3.0, step: 0.1)
                    }

                    // Scrubbing controls
                    Toggle("Scrub Mode", isOn: $isScrubbing)
                    if isScrubbing {
                        HStack {
                            Text("Progress: \(scrubProgress, specifier: "%.2f")")
                            Slider(value: $scrubProgress, in: 0.0...1.0, step: 0.01)
                        }
                    }

                    // Clip spec controls
                    Toggle("Clip Range", isOn: $useClipSpec)
                    if useClipSpec {
                        HStack {
                            Text("From: \(clipFrom, specifier: "%.2f")")
                            Slider(value: $clipFrom, in: 0.0...1.0, step: 0.05)
                        }
                        HStack {
                            Text("To: \(clipTo, specifier: "%.2f")")
                            Slider(value: $clipTo, in: 0.0...1.0, step: 0.05)
                        }
                    }
                }
                .padding()
                .background(Color.secondary.opacity(0.1))
                .cornerRadius(12)
                .padding(.horizontal)

                // Animation grid
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                    ForEach(lottieFiles, id: \.name) { lottie in
                        MotionView(lottie: lottie.container, animationSpeed: speed, loopMode: loopMode, isPlaying: isScrubbing ? false : isPlaying, contentMode: contentMode, currentProgress: isScrubbing ? scrubProgress : nil, fromProgress: useClipSpec ? clipFrom : nil, toProgress: useClipSpec ? clipTo : nil)
                            .frame(height: 100.0)
                            .clipped()
                    }
                }
                .padding()

                // Comparison: contentMode parameter vs .scaledToFill() modifier
                Text("Comparison: contentMode vs SwiftUI modifier")
                    .font(.headline)
                    .padding(.top)

                HStack(spacing: 16) {
                    VStack {
                        Text("contentMode: .fill")
                            .font(.caption)
                        if let first = lottieFiles.first {
                            MotionView(lottie: first.container, animationSpeed: speed, loopMode: loopMode, isPlaying: isPlaying, contentMode: .fill)
                                .frame(width: 80, height: 120)
                                .border(Color.red)
                                .clipped()
                        }
                    }

                    VStack {
                        Text(".scaledToFill()")
                            .font(.caption)
                        if let first = lottieFiles.first {
                            MotionView(lottie: first.container, animationSpeed: speed, loopMode: loopMode, isPlaying: isPlaying, contentMode: .fit)
                                .scaledToFill()
                                .frame(width: 80, height: 120)
                                .border(Color.blue)
                                .clipped()
                        }
                    }

                    VStack {
                        Text("contentMode: .fit")
                            .font(.caption)
                        if let first = lottieFiles.first {
                            MotionView(lottie: first.container, animationSpeed: speed, loopMode: loopMode, isPlaying: isPlaying, contentMode: .fit)
                                .frame(width: 80, height: 120)
                                .border(Color.green)
                                .clipped()
                        }
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
