// Copyright 2023–2025 Skip
import SkipFuseUI

/// All Showcase playgrounds.
///
/// We had to divide up the list to prevent Swift compiler type check time errors.
enum PlaygroundType1: CaseIterable, View {
    case accessibility
    case alert
    case animation
    //    case audio
    case background
    case blur
    case border
    case button
    case color
    case colorScheme
    //    case compose
    case confirmationDialog

    var title: String {
        switch self {
        case .accessibility:
            return NSLocalizedString("Accessibility", bundle: .module, comment: "Title of Accessibility playground")
        case .alert:
            return NSLocalizedString("Alert", bundle: .module, comment: "Title of Alert playground")
        case .animation:
            return NSLocalizedString("Animation", bundle: .module, comment: "Title of Animation playground")
//        case .audio:
//            return LocalizedStringResource("Audio")
        case .background:
            return NSLocalizedString("Background", bundle: .module, comment: "Title of Background playground")
        case .blur:
            return NSLocalizedString("Blur", bundle: .module, comment: "Title of Blur playground")
        case .border:
            return NSLocalizedString("Border", bundle: .module, comment: "Title of Border playground")
        case .button:
            return NSLocalizedString("Button", bundle: .module, comment: "Title of Button playground")
        case .color:
            return NSLocalizedString("Color", bundle: .module, comment: "Title of Color playground")
        case .colorScheme:
            return NSLocalizedString("ColorScheme", bundle: .module, comment: "Title of ColorScheme playground")
//        case .compose:
//            return LocalizedStringResource("Compose")
        case .confirmationDialog:
            return NSLocalizedString("ConfirmationDialog", bundle: .module, comment: "Title of ConfirmationDialog playground")
        }
    }

    var body: some View {
        switch self {
        case .accessibility:
            AccessibilityPlayground()
        case .alert:
            AlertPlayground()
        case .animation:
            AnimationPlayground()
//        case .audio:
//            AudioPlayground()
        case .background:
            BackgroundPlayground()
        case .blur:
            BlurPlayground()
        case .border:
            BorderPlayground()
        case .button:
            ButtonPlayground()
        case .color:
            ColorPlayground()
        case .colorScheme:
            ColorSchemePlayground()
//        case .compose:
//            ComposePlayground()
        case .confirmationDialog:
            ConfirmationDialogPlayground()
        }
    }
}

enum PlaygroundType2: CaseIterable, View {
    case datePicker
    case disclosureGroup
    case divider
    case focusState
    case form
    case frame

    var title: String {
        switch self {
        case .datePicker:
            return NSLocalizedString("DatePicker", bundle: .module, comment: "Title of DatePicker playground")
        case .disclosureGroup:
            return NSLocalizedString("DisclosureGroup", bundle: .module, comment: "Title of DisclosureGroup playground")
        case .divider:
            return NSLocalizedString("Divider", bundle: .module, comment: "Title of Divider playground")
        case .focusState:
            return NSLocalizedString("FocusState", bundle: .module, comment: "Title of FocusState playground")
        case .form:
            return NSLocalizedString("Form", bundle: .module, comment: "Title of Form playground")
        case .frame:
            return NSLocalizedString("Frame", bundle: .module, comment: "Title of Frame playground")
        }
    }

    var body: some View {
        switch self {
        case .datePicker:
            DatePickerPlayground()
        case .disclosureGroup:
            DisclosureGroupPlayground()
        case .divider:
            DividerPlayground()
        case .focusState:
            FocusStatePlayground()
        case .form:
            FormPlayground()
        case .frame:
            FramePlayground()
        }
    }
}

enum PlaygroundType3: CaseIterable, View {
    case gesture
    case geometryReader
    case gradient
    case graphics
    case grid
    case hapticFeedback
    case icon
    case image
    case keyboard

    var title: String {
        switch self {
        case .geometryReader:
            return NSLocalizedString("GeometryReader", bundle: .module, comment: "Title of GeometryReader playground")
        case .gesture:
            return NSLocalizedString("Gesture", bundle: .module, comment: "Title of Gesture playground")
        case .gradient:
            return NSLocalizedString("Gradient", bundle: .module, comment: "Title of Gradient playground")
        case .graphics:
            return NSLocalizedString("Graphics", bundle: .module, comment: "Title of Graphics playground")
        case .grid:
            return NSLocalizedString("Grids", bundle: .module, comment: "Title of Grids playground")
        case .hapticFeedback:
            return NSLocalizedString("Haptick Feedback", bundle: .module, comment: "Title of Haptick Feedback playground")
        case .icon:
            return NSLocalizedString("Icons", bundle: .module, comment: "Title of Icons playground")
        case .image:
            return NSLocalizedString("Image", bundle: .module, comment: "Title of Image playground")
        case .keyboard:
            return NSLocalizedString("Keyboard", bundle: .module, comment: "Title of Keyboard playground")
        }
    }

    var body: some View {
        switch self {
        case .geometryReader:
            GeometryReaderPlayground()
        case .gesture:
            GesturePlayground()
        case .gradient:
            GradientPlayground()
        case .graphics:
            GraphicsPlayground()
        case .grid:
            GridPlayground()
        case .hapticFeedback:
            if #available(iOS 17.0, *) {
                HapticFeedbackPlayground()
            } else {
                Text("Haptic Feedback Unavailable in this OS version")
            }
        case .icon:
            IconPlayground()
        case .image:
            ImagePlayground()
        case .keyboard:
            KeyboardPlayground()
        }
    }
}

enum PlaygroundType4: CaseIterable, View {
    case label
    case link
    case list
//    case localization
//    case map
    case menu
//    case modifier
    case navigationStack

    var title: String {
        switch self {
        case .label:
            return NSLocalizedString("Label", bundle: .module, comment: "Title of Label playground")
        case .link:
            return NSLocalizedString("Link", bundle: .module, comment: "Title of Link playground")
        case .list:
            return NSLocalizedString("List", bundle: .module, comment: "Title of List playground")
//        case .localization:
//            return LocalizedStringResource("Localization")
//        case .map:
//            return LocalizedStringResource("Map")
        case .menu:
            return NSLocalizedString("Menu", bundle: .module, comment: "Title of Menu playground")
//        case .modifier:
//            return LocalizedStringResource("Modifiers")
        case .navigationStack:
            return NSLocalizedString("NavigationStack", bundle: .module, comment: "Title of NavigationStack playground")
        }
    }

    var body: some View {
        switch self {
        case .label:
            LabelPlayground()
        case .link:
            LinkPlayground()
        case .list:
            ListPlayground()
//        case .localization:
//            LocalizationPlayground()
//        case .map:
//            MapPlayground()
        case .menu:
            MenuPlayground()
//        case .modifier:
//            ModifierPlayground()
        case .navigationStack:
            NavigationStackPlayground()
        }
    }
}

enum PlaygroundType5: CaseIterable, View {
    //    case observable
    case offsetPosition
    case onSubmit
    case overlay
    //    case pasteboard
    case picker
    case progressView
    case redacted

    var title: String {
        switch self {
//        case .observable:
//            return LocalizedStringResource("Observable")
        case .offsetPosition:
            return NSLocalizedString("Offset/Position", bundle: .module, comment: "Title of Offset/Position playground")
        case .onSubmit:
            return NSLocalizedString("OnSubmit", bundle: .module, comment: "Title of OnSubmit playground")
        case .overlay:
            return NSLocalizedString("Overlay", bundle: .module, comment: "Title of Overlay playground")
//        case .pasteboard:
//            return LocalizedStringResource("Pasteboard")
        case .picker:
            return NSLocalizedString("Picker", bundle: .module, comment: "Title of Picker playground")
        case .progressView:
            return NSLocalizedString("ProgressView", bundle: .module, comment: "Title of ProgressView playground")
        case .redacted:
            return NSLocalizedString("Redacted", bundle: .module, comment: "Title of Redacted playground")
        }
    }

    var body: some View {
        switch self {
//        case .observable:
//            ObservablePlayground()
        case .offsetPosition:
            OffsetPositionPlayground()
        case .onSubmit:
            OnSubmitPlayground()
        case .overlay:
            OverlayPlayground()
//        case .pasteboard:
//            PasteboardPlayground()
        case .picker:
            PickerPlayground()
        case .progressView:
            ProgressViewPlayground()
        case .redacted:
            RedactedPlayground()
        }
    }
}

enum PlaygroundType6: CaseIterable, View {
    case safeArea
    //    case scenePhase
    case scrollView
    case searchable
    case secureField
    case shadow
    case shape
    case shareLink
    case sheet
    case slider
    case spacer
    case stack
    case state
    case storage
    case symbol

    var title: String {
        switch self {
        case .safeArea:
            return NSLocalizedString("SafeArea", bundle: .module, comment: "Title of SafeArea playground")
//        case .scenePhase:
//            return LocalizedStringResource("ScenePhase")
        case .scrollView:
            return NSLocalizedString("ScrollView", bundle: .module, comment: "Title of ScrollView playground")
        case .searchable:
            return NSLocalizedString("Searchable", bundle: .module, comment: "Title of Searchable playground")
        case .secureField:
            return NSLocalizedString("SecureField", bundle: .module, comment: "Title of SecureField playground")
        case .shadow:
            return NSLocalizedString("Shadow", bundle: .module, comment: "Title of Shadow playground")
        case .shape:
            return NSLocalizedString("Shape", bundle: .module, comment: "Title of Shape playground")
        case .shareLink:
            return NSLocalizedString("ShareLink", bundle: .module, comment: "Title of ShareLink playground")
        case .sheet:
            return NSLocalizedString("Sheet", bundle: .module, comment: "Title of Sheet playground")
        case .slider:
            return NSLocalizedString("Slider", bundle: .module, comment: "Title of Slider playground")
        case .spacer:
            return NSLocalizedString("Spacer", bundle: .module, comment: "Title of Spacer playground")
        case .stack:
            return NSLocalizedString("Stacks", bundle: .module, comment: "Title of Stacks playground")
        case .state:
            return NSLocalizedString("State", bundle: .module, comment: "Title of State playground")
        case .storage:
            return NSLocalizedString("Storage", bundle: .module, comment: "Title of Storage playground")
        case .symbol:
            return NSLocalizedString("Symbol", bundle: .module, comment: "Title of Symbol playground")
        }
    }

    var body: some View {
        switch self {
        case .safeArea:
            SafeAreaPlayground()
//        case .scenePhase:
//            ScenePhasePlayground()
        case .scrollView:
            ScrollViewPlayground()
        case .searchable:
            SearchablePlayground()
        case .secureField:
            SecureFieldPlayground()
        case .shadow:
            ShadowPlayground()
        case .shape:
            ShapePlayground()
        case .shareLink:
            ShareLinkPlayground()
        case .sheet:
            SheetPlayground()
        case .slider:
            SliderPlayground()
        case .spacer:
            SpacerPlayground()
        case .stack:
            StackPlayground()
        case .state:
            StatePlayground()
        case .storage:
            StoragePlayground()
        case .symbol:
            SymbolPlayground()
        }
    }
}

enum PlaygroundType7: CaseIterable, View {
//    case table
    case tabView
    case text
    case textEditor
    case textField
    case toggle
    case toolbar
    case timer
    case transition

    var title: String {
        switch self {
//        case .table:
//            return LocalizedStringResource("Table")
        case .tabView:
            return NSLocalizedString("TabView", bundle: .module, comment: "Title of TabView playground")
        case .text:
            return NSLocalizedString("Text", bundle: .module, comment: "Title of Text playground")
        case .textEditor:
            return NSLocalizedString("TextEditor", bundle: .module, comment: "Title of Text playground")
        case .textField:
            return NSLocalizedString("TextField", bundle: .module, comment: "Title of TextField playground")
        case .timer:
            return NSLocalizedString("Timer", bundle: .module, comment: "Title of Timer playground")
        case .toggle:
            return NSLocalizedString("Toggle", bundle: .module, comment: "Title of Toggle playground")
        case .toolbar:
            return NSLocalizedString("Toolbar", bundle: .module, comment: "Title of Toolbar playground")
        case .transition:
            return NSLocalizedString("Transition", bundle: .module, comment: "Title of Transition playground")
        }
    }

    var body: some View {
        switch self {
//        case .table:
//            TablePlayground()
        case .tabView:
            TabViewPlayground()
        case .text:
            TextPlayground()
        case .textEditor:
            TextEditorPlayground()
        case .textField:
            TextFieldPlayground()
        case .timer:
            TimerPlayground()
        case .toggle:
            TogglePlayground()
        case .toolbar:
            ToolbarPlayground()
        case .transition:
            TransitionPlayground()
        }
    }
}

enum PlaygroundType8: CaseIterable, View {
//    case videoPlayer
//    case webView
    case zIndex

    var title: String {
        switch self {
//        case .videoPlayer:
//            return LocalizedStringResource("Video Player")
//        case .webView:
//            return LocalizedStringResource("WebView")
        case .zIndex:
            return NSLocalizedString("ZIndex", bundle: .module, comment: "Title of ZIndex playground")
        }
    }

    var body: some View {
        switch self {
//        case .videoPlayer:
//            VideoPlayerPlayground()
//        case .webView:
//            WebViewPlayground()
        case .zIndex:
            ZIndexPlayground()
        }
    }
}

/// List to navigate to each playground.
public struct PlaygroundNavigationView: View {
    @State var searchText = ""

    public init() {
    }

    public var body: some View {
        NavigationStack {
            List {
                ForEach(matchingPlaygroundTypes(PlaygroundType1.self, title: \.title), id: \.self) { playground in
                    NavigationLink(value: playground, label: { Text(playground.title) })
                }
                ForEach(matchingPlaygroundTypes(PlaygroundType2.self, title: \.title), id: \.self) { playground in
                    NavigationLink(value: playground, label: { Text(playground.title) })
                }
                ForEach(matchingPlaygroundTypes(PlaygroundType3.self, title: \.title), id: \.self) { playground in
                    NavigationLink(value: playground, label: { Text(playground.title) })
                }
                ForEach(matchingPlaygroundTypes(PlaygroundType4.self, title: \.title), id: \.self) { playground in
                    NavigationLink(value: playground, label: { Text(playground.title) })
                }
                ForEach(matchingPlaygroundTypes(PlaygroundType5.self, title: \.title), id: \.self) { playground in
                    NavigationLink(value: playground, label: { Text(playground.title) })
                }
                ForEach(matchingPlaygroundTypes(PlaygroundType6.self, title: \.title), id: \.self) { playground in
                    NavigationLink(value: playground, label: { Text(playground.title) })
                }
                ForEach(matchingPlaygroundTypes(PlaygroundType7.self, title: \.title), id: \.self) { playground in
                    NavigationLink(value: playground, label: { Text(playground.title) })
                }
                ForEach(matchingPlaygroundTypes(PlaygroundType8.self, title: \.title), id: \.self) { playground in
                    NavigationLink(value: playground, label: { Text(playground.title) })
                }
            }
            .navigationTitle(Text("Showcase"))
            .navigationDestination(for: PlaygroundType1.self) {
                $0.navigationTitle($0.title)
            }
            .navigationDestination(for: PlaygroundType2.self) {
                $0.navigationTitle($0.title)
            }
            .navigationDestination(for: PlaygroundType3.self) {
                $0.navigationTitle($0.title)
            }
            .navigationDestination(for: PlaygroundType4.self) {
                $0.navigationTitle($0.title)
            }
            .navigationDestination(for: PlaygroundType5.self) {
                $0.navigationTitle($0.title)
            }
            .navigationDestination(for: PlaygroundType6.self) {
                $0.navigationTitle($0.title)
            }
            .navigationDestination(for: PlaygroundType7.self) {
                $0.navigationTitle($0.title)
            }
            .navigationDestination(for: PlaygroundType8.self) {
                $0.navigationTitle($0.title)
            }
            .searchable(text: $searchText)
        }
    }

    private func matchingPlaygroundTypes<T>(_ type: T.Type, title: KeyPath<T, String>) -> [T] where T: CaseIterable {
        return type.allCases.filter {
            let words = $0[keyPath: title].split(separator: " ")
            let prefix = searchText.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
            return words.contains { $0.lowercased().starts(with: prefix) }
        }
    }
}


