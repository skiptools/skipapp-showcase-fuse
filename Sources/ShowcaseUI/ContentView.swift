// Copyright 2023–2025 Skip
#if os(Android)
import SkipFuseUI
#else
import SwiftUI
#endif

enum ContentTab: String, Hashable {
    case about, showcase, settings
}

// SKIP @bridge
public struct ContentView: View {
    /*~~~ @AppStorage("tab")*/ @State var tab = ContentTab.about
    /*~~~ @AppStorage("appearance")*/ @State var appearance = ""

    // SKIP @bridge
    public init() {
    }

    public var body: some View {
        TabView(selection: $tab) {
            AboutView()
                .tag(ContentTab.about)
                .tabItem {
                    Label("About", systemImage: "info.circle")
                }
            PlaygroundNavigationView()
                .tag(ContentTab.showcase)
                .tabItem {
                    Label {
                        Text("Showcase")
                    } icon: {
                        Image("widgets", bundle: .module, label: Text("Showcase Icon"))
                    }
                }
            SettingsView(appearance: $appearance)
                .tag(ContentTab.settings)
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
        .preferredColorScheme(appearance == "dark" ? .dark : appearance == "light" ? .light : nil)
    }
}

struct PlaygroundNavigationView : View {
    var body: some View {
        Text("Playgrounds")
    }
}

#if !os(Android)
#Preview {
    ContentView()
}
#endif
