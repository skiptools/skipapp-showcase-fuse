// Copyright 2024 Skip
//
// This is a free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org

import SwiftUI

struct NewAnimationPlayground: View {
    @State var blur = false
    @State var brightness = false
    @State var saturation = false
    @State var contrast = false
    @State var hue = false
    @State var grayscale = false
    @State var shadow = false
    @State var border = false
    @State var corner = false
    @State var combined = false
    @State var useAnimation = true

    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                Text("Tap each item to animate independently")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Toggle("Use Animation", isOn: $useAnimation)
                    .padding(.vertical, 4)

                Button(action: {
                    performAnimation {
                        blur.toggle()
                        brightness.toggle()
                        saturation.toggle()
                        contrast.toggle()
                        hue.toggle()
                        grayscale.toggle()
                        shadow.toggle()
                        border.toggle()
                        corner.toggle()
                    }
                }) {
                    Text("Animate All")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.vertical, 8)

                // Blur Test
                HStack {
                    Text(".blur(radius:)").font(.caption)
                    Spacer()
                    Rectangle()
                        .fill(LinearGradient(colors: [.blue, .purple, .pink], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 70, height: 70)
                        .blur(radius: blur ? 10 : 0)
                        .onTapGesture {
                            performAnimation {
                                blur.toggle()
                            }
                        }
                }

                // Brightness Test
                HStack {
                    Text(".brightness(_:)").font(.caption)
                    Spacer()
                    Rectangle()
                        .fill(LinearGradient(colors: [.blue, .purple, .pink], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 70, height: 70)
                        .brightness(brightness ? 0.3 : 0)
                        .onTapGesture {
                            performAnimation {
                                brightness.toggle()
                            }
                        }
                }

                // Saturation Test
                HStack {
                    Text(".saturation(_:)").font(.caption)
                    Spacer()
                    Rectangle()
                        .fill(LinearGradient(colors: [.blue, .purple, .pink], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 70, height: 70)
                        .saturation(saturation ? 0.2 : 1.0)
                        .onTapGesture {
                            performAnimation {
                                saturation.toggle()
                            }
                        }
                }

                // Contrast Test
                HStack {
                    Text(".contrast(_:)").font(.caption)
                    Spacer()
                    Rectangle()
                        .fill(LinearGradient(colors: [.blue, .purple, .pink], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 70, height: 70)
                        .contrast(contrast ? 2.0 : 1.0)
                        .onTapGesture {
                            performAnimation {
                                contrast.toggle()
                            }
                        }
                }

                // Hue Rotation Test
                HStack {
                    Text(".hueRotation(_:)").font(.caption)
                    Spacer()
                    Rectangle()
                        .fill(LinearGradient(colors: [.blue, .purple, .pink], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 70, height: 70)
                        .hueRotation(.degrees(hue ? 180 : 0))
                        .onTapGesture {
                            performAnimation {
                                hue.toggle()
                            }
                        }
                }

                // Grayscale Test
                HStack {
                    Text(".grayscale(_:)").font(.caption)
                    Spacer()
                    Rectangle()
                        .fill(LinearGradient(colors: [.blue, .purple, .pink], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 70, height: 70)
                        .grayscale(grayscale ? 1.0 : 0)
                        .onTapGesture {
                            performAnimation {
                                grayscale.toggle()
                            }
                        }
                }

                // Border Width Test
                HStack {
                    Text(".border(width:)").font(.caption)
                    Spacer()
                    Rectangle()
                        .fill(LinearGradient(colors: [.blue, .purple, .pink], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 70, height: 70)
                        .border(Color.blue, width: border ? 8 : 1)
                        .onTapGesture {
                            performAnimation {
                                border.toggle()
                            }
                        }
                }

                // Corner Radius Test
                HStack {
                    Text(".cornerRadius(_:)").font(.caption)
                    Spacer()
                    Rectangle()
                        .fill(LinearGradient(colors: [.blue, .purple, .pink], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 70, height: 70)
                        .cornerRadius(corner ? 35 : 0)
                        .onTapGesture {
                            performAnimation {
                                corner.toggle()
                            }
                        }
                }

                // Combined Test
                Divider()
                    .padding(.vertical, 4)

                HStack {
                    Text("All combined").font(.caption).bold()
                    Spacer()
                    Rectangle()
                        .fill(LinearGradient(colors: [.blue, .purple, .pink], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 70, height: 70)
                        .blur(radius: combined ? 10 : 0)
                        .brightness(combined ? 0.3 : 0)
                        .saturation(combined ? 0.2 : 1.0)
                        .contrast(combined ? 2.0 : 1.0)
                        .hueRotation(.degrees(combined ? 180 : 0))
                        .grayscale(combined ? 1.0 : 0)
                        .shadow(color: .black.opacity(0.5), radius: combined ? 15 : 0, x: combined ? 10 : 0, y: combined ? 10 : 0)
                        .border(Color.white, width: combined ? 8 : 1)
                        .cornerRadius(combined ? 35 : 8)
                        .padding(20)
                        .onTapGesture {
                            performAnimation {
                                combined.toggle()
                            }
                        }
                }

                Divider()
                    .padding(.vertical, 4)

                // Shadow Test (NOT animated - crashes when animated)
                HStack {
                    Text(".shadow(...) - NOT animated").font(.caption)
                    Spacer()
                    Rectangle()
                        .fill(LinearGradient(colors: [.blue, .purple, .pink], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 70, height: 70)
                        .shadow(color: .black.opacity(0.5), radius: shadow ? 15 : 0, x: shadow ? 10 : 0, y: shadow ? 10 : 0)
                        .padding(20)
                        .onTapGesture {
                            performAnimation {
                                shadow.toggle()
                            }
                        }
                }
            }
            .padding()
        }
        .navigationTitle("New Animation Tests")
        #if !SKIP
        .navigationBarTitleDisplayMode(.inline)
        #endif
        .toolbar {
            PlaygroundSourceLink(file: "NewAnimationPlayground.swift")
        }
    }

    private func performAnimation(_ action: @escaping () -> Void) {
        if useAnimation {
            withAnimation(.spring(duration: 1.0)) {
                action()
            }
        } else {
            action()
        }
    }
}
