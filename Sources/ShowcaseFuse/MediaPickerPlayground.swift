// Copyright 2023–2025 Skip
import Foundation
import SkipFuseUI
import SkipKit

/// This component uses the `SkipKit` module from https://source.skip.tools/skip-kit
struct MediaPickerPlayground: View {
    @State var mediaURL: URL? = nil
    @State var isPickerPresented = false

    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Button("Select") {
                    isPickerPresented = true
                }
                AsyncImage(url: mediaURL) { image in
                    image
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .padding()
            }
        }
        .withMediaPicker(type: .library, isPresented: $isPickerPresented, selectedImageURL: $mediaURL)
        .toolbar {
            PlaygroundSourceLink(file: "MediaPickerPlayground.swift")
        }
    }
}
