// Copyright 2023–2025 Skip
import SkipKit
import SwiftUI
import SkipMarketplace

struct SettingsView: View {
    @Binding var appearance: String

    var body: some View {
        NavigationStack {
            Form {
                Picker("Appearance", selection: $appearance) {
                    Text("System").tag("")
                    Text("Light").tag("light")
                    Text("Dark").tag("dark")
                }
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
                    .toolbar {
                        ToolbarItem {
                            Button("System Settings") {
                                Task {
                                    await UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                                }
                            }
                        }
                    }
                    .navigationTitle("System Information")
                }
                HStack {
                    #if os(Android)
                    ComposeView {
                        HeartComposer()
                    }
                    #else
                    Text(verbatim: "💙")
                    #endif
                    if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String,
                       let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
                        Text("Version \(version) (\(buildNumber))")
                            .foregroundStyle(.gray)
                    }
                    Text("Powered by [Skip](https://skip.tools)")
                }
                .onTapGesture {
                    logger.info("requesting marketplace review")
                    Marketplace.current.requestReview(period: .days(0))
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#if SKIP

struct HeartComposer : ContentComposer {
    @Composable func Compose(context: ComposeContext) {
        androidx.compose.material3.Text("💚", modifier: context.modifier)
    }
}

#endif
