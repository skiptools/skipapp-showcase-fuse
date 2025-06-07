// Copyright 2023–2025 Skip
import SwiftUI

enum SafeAreaPlaygroundType: String, CaseIterable {
    case fullscreenContent
    case fullscreenBackground
    case plainList
    case plainListNoNavStack
    case list
    case bottomBar

    var title: String {
        switch self {
        case .fullscreenContent:
            return "Ignore safe area"
        case .fullscreenBackground:
            return "Background ignores safe area"
        case .plainList:
            return "Plain list"
        case .plainListNoNavStack:
            return "Plain list outside nav stack"
        case .list:
            return "List"
        case .bottomBar:
            return "Bottom toolbar"
        }
    }

    var coverId: String {
        rawValue + "Cover"
    }

    var sheetId: String {
        rawValue + "Sheet"
    }
}

struct SafeAreaPlayground: View {
    @State var isCoverPresented = false
    @State var isSheetPresented = false
    @State var playgroundType: SafeAreaPlaygroundType = .fullscreenContent

    var body: some View {
        List {
            NavigationLink("Background") {
                SafeAreaBackgroundView()
            }
            Section("Fullscreen cover") {
                ForEach(SafeAreaPlaygroundType.allCases, id: \.coverId) { playgroundType in
                    Button(playgroundType.title) {
                        self.playgroundType = playgroundType
                        isCoverPresented = true
                    }
                }
            }
            Section("Sheet") {
                ForEach(SafeAreaPlaygroundType.allCases, id: \.sheetId) { playgroundType in
                    Button(playgroundType.title) {
                        self.playgroundType = playgroundType
                        isSheetPresented = true
                    }
                }
            }
        }
        #if os(macOS)
        .sheet(isPresented: $isSheetPresented) {
            playground(for: playgroundType)
        }
        #else
        .sheet(isPresented: $isSheetPresented) {
            playground(for: playgroundType)
        }
        .fullScreenCover(isPresented: $isCoverPresented) {
            playground(for: playgroundType)
        }
        #endif
    }

    @ViewBuilder private func playground(for playgroundType: SafeAreaPlaygroundType) -> some View {
        switch playgroundType {
        case .fullscreenContent:
            SafeAreaFullscreenContent()
        case .fullscreenBackground:
            SafeAreaFullscreenBackground()
        case .plainList:
            SafeAreaPlainList()
        case .plainListNoNavStack:
            SafeAreaPlainListNoNavStack()
        case .list:
            SafeAreaList()
        case .bottomBar:
            #if os(macOS)
            SafeAreaList()
            #else
            SafeAreaBottomBar()
            #endif
        }
    }
}

struct SafeAreaBackgroundView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button("Dismiss") {
            dismiss()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.yellow, ignoresSafeAreaEdges: .all)
    }
}

struct SafeAreaFullscreenContent: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Color.yellow
            Button("Dimiss") {
                dismiss()
            }
        }
        .border(.blue, width: 20.0)
        .ignoresSafeArea()
    }
}

struct SafeAreaFullscreenBackground: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            Button("Dimiss") {
                dismiss()
            }
        }
        .border(.blue, width: 20.0)
    }
}

struct SafeAreaPlainList: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            List(0..<40) { index in
                Text("Row: \(index)")
            }
            .listStyle(.plain)
            .navigationTitle(SafeAreaPlaygroundType.plainList.title)
            .toolbar {
                Button("Dismiss") {
                    dismiss()
                }
            }
        }
    }
}

struct SafeAreaPlainListNoNavStack: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        List {
            Button("Dismiss") { dismiss() }
            ForEach(0..<40) { index in
                Text("Row: \(index)")
            }
        }
        .listStyle(.plain)
    }
}

struct SafeAreaList: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            List(0..<40) { index in
                Text("Row: \(index)")
            }
            .navigationTitle(SafeAreaPlaygroundType.list.title)
            .toolbar {
                Button("Dismiss") {
                    dismiss()
                }
            }
        }
    }
}

#if os(macOS)
#else
struct SafeAreaBottomBar: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            List(0..<40) { index in
                Text("Row: \(index)")
            }
            .navigationTitle(SafeAreaPlaygroundType.bottomBar.title)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("Dismiss") {
                        dismiss()
                    }
                }
            }
        }
    }
}
#endif
