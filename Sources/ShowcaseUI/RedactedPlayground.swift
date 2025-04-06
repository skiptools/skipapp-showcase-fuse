// Copyright 2024–2025 Skip
import SkipFuseUI

struct RedactedPlayground: View {
    var body: some View {
        List {
            Section(".placeholder") {
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
            }
        }
        .toolbar {
            PlaygroundSourceLink(file: "RedactedPlayground.swift")
        }
    }
}
