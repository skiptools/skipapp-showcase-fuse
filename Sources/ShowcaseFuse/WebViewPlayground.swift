// Copyright 2025 Skip
import SkipFuseUI
import SkipWeb

struct WebViewPlayground: View {
    var body: some View {
        VStack {
            WebView(url: URL(string: "https://skip.tools")!)
        }
    }
}
