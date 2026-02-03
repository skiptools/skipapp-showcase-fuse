// Copyright 2023–2025 Skip
import SwiftUI

struct AnimationPlayground: View {
    @State var isOn = false
    @State var unrelatedIsOn = false
    @State var isRepeatOn = false

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text("Also see the `Transition` playground for view enter/exit animations")
                HStack {
                    Text(".opacity")
                    Spacer()
                    Color.red
                        .frame(width: 100, height: 100)
                        .opacity(isOn ? 0.2 : 1.0)
                        .onTapGesture {
                            isOn = !isOn
                        }
                }
                HStack {
                    Text(".opacity.animation")
                    Spacer()
                    Color.red
                        .frame(width: 100, height: 100)
                        .opacity(isOn ? 0.2 : 1.0)
                        .animation(.default, value: isOn)
                        .onTapGesture {
                            isOn = !isOn
                        }
                }
                HStack {
                    Text(".opacity.animation\n(different value)")
                    Spacer()
                    Color.red
                        .frame(width: 100, height: 100)
                        .opacity(isOn || unrelatedIsOn ? 0.2 : 1.0)
                        .animation(.default, value: isOn)
                        .onTapGesture {
                            unrelatedIsOn = !unrelatedIsOn
                        }
                }
                Button("withAnimation") {
                    withAnimation { isOn = !isOn }
                }
                .buttonStyle(.bordered)
                HStack {
                    Text(".foreground/.background")
                    Spacer()
                    Text("Text")
                        .font(.largeTitle)
                        .bold()
                        .frame(width: 100, height: 100)
                        .foregroundStyle(isOn ? Color.white : Color.black)
                        .background(isOn ? Color.black : Color.white)
                        .border(Color.blue)
                        .onTapGesture {
                            isOn = !isOn
                        }
                }
                HStack {
                    Text(".foreground/.background.animation")
                    Spacer()
                    Text("Text")
                        .font(.largeTitle)
                        .bold()
                        .frame(width: 100, height: 100)
                        .foregroundStyle(isOn ? Color.white : Color.black)
                        .background(isOn ? Color.black : Color.white)
                        .border(Color.blue)
                        .animation(.default, value: isOn)
                        .onTapGesture {
                            isOn = !isOn
                        }
                }
                Button("withAnimation") {
                    withAnimation { isOn = !isOn }
                }
                .buttonStyle(.bordered)
                HStack {
                    Text(".fill")
                    Spacer()
                    Circle()
                        .fill(isOn ? Color.blue : Color.red)
                        .frame(width: 100, height: 100)
                        .onTapGesture {
                            isOn = !isOn
                        }
                }
                HStack {
                    Text(".fill.animation")
                    Spacer()
                    Circle()
                        .fill(isOn ? Color.blue : Color.red)
                        .frame(width: 100, height: 100)
                        .animation(.default, value: isOn)
                        .onTapGesture {
                            isOn = !isOn
                        }
                }
                Button("withAnimation") {
                    withAnimation { isOn = !isOn }
                }
                .buttonStyle(.bordered)
                HStack {
                    Text(".offset")
                    Spacer()
                    ZStack {
                        Color.red
                            .frame(width: 20, height: 20)
                            .offset(isOn ? CGSize(width: 50, height: 10) : CGSize(width: 0, height: 0))
                    }
                    .frame(width: 100, height: 100)
                    .background(.gray)
                    .onTapGesture {
                        isOn = !isOn
                    }
                }
                HStack {
                    Text(".offset.animation")
                    Spacer()
                    ZStack {
                        Color.red
                            .frame(width: 20, height: 20)
                            .offset(isOn ? CGSize(width: 50, height: 10) : CGSize(width: 0, height: 0))
                            .animation(.default, value: isOn)
                    }
                    .frame(width: 100, height: 100)
                    .background(.gray)
                    .onTapGesture {
                        isOn = !isOn
                    }
                }
                Button("withAnimation") {
                    withAnimation { isOn = !isOn }
                }
                .buttonStyle(.bordered)
                HStack {
                    Text(".frame")
                    Spacer()
                    ZStack {
                        Color.red
                            .frame(width: isOn ? 100.0 : 40.0, height: isOn ? 60.0 : 40.0)
                    }
                    .frame(width: 100, height: 100)
                    .background(.gray)
                    .onTapGesture {
                        isOn = !isOn
                    }
                }
                HStack {
                    Text(".frame.animation")
                    Spacer()
                    ZStack {
                        Color.red
                            .frame(width: isOn ? 100.0 : 40.0, height: isOn ? 60.0 : 40.0)
                            .animation(.default, value: isOn)
                    }
                    .frame(width: 100, height: 100)
                    .background(.gray)
                    .onTapGesture {
                        isOn = !isOn
                    }
                }
                Button("withAnimation") {
                    withAnimation { isOn = !isOn }
                }
                .buttonStyle(.bordered)
                HStack {
                    Text(".rotationEffect")
                    Spacer()
                    Color.red
                        .frame(width: 100, height: 100)
                        .rotationEffect(isOn ? .degrees(45) : .degrees(0))
                        .onTapGesture {
                            isOn = !isOn
                        }
                }
                HStack {
                    Text(".rotationEffect.animation")
                    Spacer()
                    Color.red
                        .frame(width: 100, height: 100)
                        .rotationEffect(isOn ? .degrees(45) : .degrees(0))
                        .animation(.default, value: isOn)
                        .onTapGesture {
                            isOn = !isOn
                        }
                }
                Button("withAnimation") {
                    withAnimation { isOn = !isOn }
                }
                .buttonStyle(.bordered)
                HStack {
                    Text(".scaleEffect")
                    Spacer()
                    Color.red
                        .frame(width: 100, height: 100)
                        .scaleEffect(isOn ? 0.5 : 1.0)
                        .onTapGesture {
                            isOn = !isOn
                        }
                }
                HStack {
                    Text(".scaleEffect.animation")
                    Spacer()
                    Color.red
                        .frame(width: 100, height: 100)
                        .scaleEffect(isOn ? 0.5 : 1.0)
                        .animation(.default, value: isOn)
                        .onTapGesture {
                            isOn = !isOn
                        }
                }
                Button("withAnimation") {
                    withAnimation { isOn = !isOn }
                }
                .buttonStyle(.bordered)
                HStack {
                    Text(".font")
                    Spacer()
                    Text("Hello")
                        .font(.system(size: isOn ? 30.0 : 20.0))
                        .frame(width: 100, height: 100)
                        .border(Color.blue)
                        .onTapGesture {
                            isOn = !isOn
                        }
                }
                HStack {
                    Text(".font.animation")
                    Spacer()
                    Text("Hello")
                        .font(.system(size: isOn ? 30.0 : 20.0))
                        .frame(width: 100, height: 100)
                        .border(Color.blue)
                        .animation(.default, value: isOn)
                        .onTapGesture {
                            isOn = !isOn
                        }
                }
                Button("withAnimation") {
                    withAnimation { isOn = !isOn }
                }
                .buttonStyle(.bordered)
                HStack {
                    Text(".animation(.spring)")
                    Spacer()
                    ZStack {
                        Color.red
                            .frame(width: 20, height: 20)
                            .offset(isOn ? CGSize(width: 0, height: 50) : CGSize(width: 0, height: -50))
                            .animation(.spring, value: isOn)
                    }
                    .frame(width: 100, height: 100)
                    .background(.gray)
                    .onTapGesture {
                        isOn = !isOn
                    }
                }
                HStack {
                    Text("withAnimation(.spring)")
                    Spacer()
                    ZStack {
                        Color.red
                            .frame(width: 20, height: 20)
                            .offset(isOn ? CGSize(width: 0, height: 50) : CGSize(width: 0, height: -50))
                    }
                    .frame(width: 100, height: 100)
                    .background(.gray)
                    .onTapGesture {
                        withAnimation(.spring) { isOn = !isOn }
                    }
                }
                HStack {
                    Text(".animation(.easeIn(duration: 1))")
                    Spacer()
                    ZStack {
                        Color.red
                            .frame(width: 20, height: 20)
                            .offset(isOn ? CGSize(width: 0, height: 50) : CGSize(width: 0, height: -50))
                            .animation(.easeIn(duration: 1), value: isOn)
                    }
                    .frame(width: 100, height: 100)
                    .background(.gray)
                    .onTapGesture {
                        isOn = !isOn
                    }
                }
                HStack {
                    Text("withAnimation(.easeIn(duration: 1))")
                    Spacer()
                    ZStack {
                        Color.red
                            .frame(width: 20, height: 20)
                            .offset(isOn ? CGSize(width: 0, height: 50) : CGSize(width: 0, height: -50))
                    }
                    .frame(width: 100, height: 100)
                    .background(.gray)
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 1)) { isOn = !isOn }
                    }
                }
                HStack {
                    Text(".animation(repeatCount(3))")
                    Spacer()
                    ZStack {
                        Color.red
                            .frame(width: 20, height: 20)
                            .offset(isOn ? CGSize(width: 0, height: 50) : CGSize(width: 0, height: -50))
                            .animation(.default.repeatCount(3), value: isOn)
                    }
                    .frame(width: 100, height: 100)
                    .background(.gray)
                    .onTapGesture {
                        isOn = !isOn
                    }
                }
                HStack {
                    Text("withAnimation(repeatCount(3))")
                    Spacer()
                    ZStack {
                        Color.red
                            .frame(width: 20, height: 20)
                            .offset(isOn ? CGSize(width: 0, height: 50) : CGSize(width: 0, height: -50))
                    }
                    .frame(width: 100, height: 100)
                    .background(.gray)
                    .onTapGesture {
                        withAnimation(.default.repeatCount(3)) { isOn = !isOn }
                    }
                }
                HStack {
                    Text(".animation(autoreverses: false))")
                    Spacer()
                    ZStack {
                        Color.red
                            .frame(width: 20, height: 20)
                            .offset(isOn ? CGSize(width: 0, height: 50) : CGSize(width: 0, height: -50))
                            .animation(.default.repeatCount(3, autoreverses: false), value: isOn)
                    }
                    .frame(width: 100, height: 100)
                    .background(.gray)
                    .onTapGesture {
                        isOn = !isOn
                    }
                }
                HStack {
                    Text(".repeatForever()")
                    Spacer()
                    ZStack {
                        Color.red
                            .frame(width: 20, height: 20)
                            .offset(isRepeatOn ? CGSize(width: 0, height: 50) : CGSize(width: 0, height: -50))
                            .animation(.default.repeatForever(), value: isRepeatOn)
                    }
                    .frame(width: 100, height: 100)
                    .background(.gray)
                    .onAppear {
                        isRepeatOn = true
                    }
                    .onTapGesture {
                        isOn = !isOn
                    }
                }
                HStack {
                    Text(".trim")
                    Spacer()
                    ZStack {
                        Circle()
                            .stroke(Color.gray.opacity(0.3), lineWidth: 12)
                        Circle()
                            .trim(from: 0, to: isOn ? 1.0 : 0.0)
                            .stroke(
                                LinearGradient(
                                    colors: [.blue, .purple],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                style: StrokeStyle(lineWidth: 12, lineCap: .round)
                            )
                            .rotationEffect(.degrees(-90))
                        Text("\(Int((isOn ? 1.0 : 0.0) * 100))%")
                            .font(.title)
                            .bold()
                    }
                    .frame(width: 120, height: 120)
                    .onTapGesture {
                        isOn = !isOn
                    }
                }
                HStack {
                    Text(".trim.animation")
                    Spacer()
                    ZStack {
                        Circle()
                            .stroke(Color.gray.opacity(0.3), lineWidth: 12)
                        Circle()
                            .trim(from: 0, to: isOn ? 1.0 : 0.0)
                            .stroke(
                                LinearGradient(
                                    colors: [.blue, .purple],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                style: StrokeStyle(lineWidth: 12, lineCap: .round)
                            )
                            .rotationEffect(.degrees(-90))
                            .animation(.easeInOut(duration: 1.5), value: isOn)
                        Text("\(Int((isOn ? 1.0 : 0.0) * 100))%")
                            .font(.title)
                            .bold()
                    }
                    .frame(width: 120, height: 120)
                    .onTapGesture {
                        isOn = !isOn
                    }
                }
                Button("withAnimation") {
                    withAnimation(.easeInOut(duration: 1.5)) { isOn = !isOn }
                }
                .buttonStyle(.bordered)
                NavigationLink("Push") {
                    Text("Pushed")
                }
                .buttonStyle(.bordered)
            }
            .padding()
        }
        .toolbar {
            PlaygroundSourceLink(file: "AnimationPlayground.swift")
        }
    }
}
