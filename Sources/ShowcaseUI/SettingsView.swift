// Copyright 2023–2025 Skip
import Foundation
#if os(Android)
import SkipFuseUI
#else
import SwiftUI
#endif

struct SettingsView: View {
    @Binding var appearance: String

    var body: some View {
        NavigationStack {
            Form {
                //~~~
//                Picker("appearance_key", selection: $appearance) {
//                    Text("System").tag("")
//                    Text("Light").tag("light")
//                    Text("Dark").tag("dark")
//                }
                NavigationLink("System Information") {
                    let env = ProcessInfo.processInfo.environment
                    List {
                        ForEach(env.keys.sorted(), id: \.self) { key in
                            HStack {
                                Text(key)
                                Text(env[key] ?? "")
                                    .frame(alignment: .trailing)
                            }
                            .font(Font.caption.monospaced())
                        }
                    }
                    .navigationTitle("System Information")
                }
                HStack {
                    //~~~ Convert to ContentComposer
//                    #if SKIP
//                    ComposeView { ctx in // Mix in Compose code!
//                        androidx.compose.material3.Text("💚", modifier: ctx.modifier)
//                    }
//                    #else
                    Text(verbatim: "💙")
//                    #endif
//                    // ~~~ Problem: our ViewBuilder impl doesn't handle this "if let" properly
//                    if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String,
//                       let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
//                        Text("Version \(version) (\(buildNumber))")
//                            .foregroundStyle(.gray)
//                    }
                    Text("Powered by [Skip](https://skip.tools)")
                }
            }
            .navigationTitle("Settings")
        }
    }
}
