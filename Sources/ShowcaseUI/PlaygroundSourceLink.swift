// Copyright 2023–2025 Skip
import Foundation
#if os(Android) || ROBOLECTRIC
import SkipFuseUI
#else
import SwiftUI
#endif

/// Displays a link to the source code for the given playground type.
struct PlaygroundSourceLink : View {
    private let destination: URL

    init(file: String) {
        destination = URL(string: showcaseSourceURLString + playgroundPath + file)!
    }

    var body: some View {
        Link("Source", destination: destination)
    }
}
