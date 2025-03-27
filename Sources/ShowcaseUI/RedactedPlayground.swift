// Copyright 2024–2025 Skip
#if os(Android) || ROBOLECTRIC
import SkipFuseUI
#else
import SwiftUI
#endif

struct RedactedPlayground: View {
    var body: some View {
        List {
            //~~~ TODO: Section
//            Section(".placeholder") {
                NavigationLink("Text") {
                    TextPlayground(redaction: .placeholder)
                }
                //~~~ TODO: Form playground
//                NavigationLink("Form") {
//                    FormPlayground(redaction: .placeholder)
//                }
                NavigationLink("Image") {
                    ImagePlayground(redaction: .placeholder)
                }
//            }
        }
        .toolbar {
            PlaygroundSourceLink(file: "RedactedPlayground.swift")
        }
    }
}
