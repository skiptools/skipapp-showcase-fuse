// Copyright 2023–2025 Skip
import SkipFuseUI

/// All Showcase playgrounds, part 1.
///
/// We had to divide up the list to prevent Swift compiler type check time errors.
enum PlaygroundType1: CaseIterable, View {
    //    case accessibility
    case alert
    case animation
    //    case audio
    case background
    //    case blur
    case border
    case button
    case color
    case colorScheme
    //    case compose
    case confirmationDialog
    case datePicker
    //    case disclosureGroup
    case divider
    case focusState
    //    case form
    case frame

    var title: String {
        switch self {
//        case .accessibility:
//            return LocalizedStringResource("Accessibility")
        case .alert:
            return NSLocalizedString("Alert", bundle: .module, comment: "Title of Alert playground")
        case .animation:
            return NSLocalizedString("Animation", bundle: .module, comment: "Title of Animation playground")
//        case .audio:
//            return LocalizedStringResource("Audio")
        case .background:
            return NSLocalizedString("Background", bundle: .module, comment: "Title of Background playground")
//        case .blur:
//            return LocalizedStringResource("Blur")
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
        case .datePicker:
            return NSLocalizedString("DatePicker", bundle: .module, comment: "Title of DatePicker playground")
//        case .disclosureGroup:
//            return LocalizedStringResource("DisclosureGroup")
        case .divider:
            return NSLocalizedString("Divider", bundle: .module, comment: "Title of Divider playground")
        case .focusState:
            return NSLocalizedString("FocusState", bundle: .module, comment: "Title of FocusState playground")
//        case .form:
//            return LocalizedStringResource("Form")
        case .frame:
            return NSLocalizedString("Frame", bundle: .module, comment: "Title of Frame playground")
        }
    }

    var body: some View {
        switch self {
//        case .accessibility:
//            AccessibilityPlayground()
        case .alert:
            AlertPlayground()
        case .animation:
            AnimationPlayground()
//        case .audio:
//            AudioPlayground()
        case .background:
            BackgroundPlayground()
//        case .blur:
//            BlurPlayground()
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
        case .datePicker:
            DatePickerPlayground()
//        case .disclosureGroup:
//            DisclosureGroupPlayground()
        case .divider:
            DividerPlayground()
        case .focusState:
            FocusStatePlayground()
//        case .form:
//            FormPlayground()
        case .frame:
            FramePlayground()
        }
    }
}

/// All Showcase playgrounds, part 2.
///
/// We had to divide up the list to prevent Swift compiler type check time errors.
enum PlaygroundType2: CaseIterable, View {
//    case gesture
//    case geometryReader
    case gradient
//    case graphics
//    case grid
//    case hapticFeedback
    case icon
    case image
//    case keyboard
    case label
    case link
//    case list
//    case localization
//    case map
//    case menu
//    case modifier
    case navigationStack

    var title: String {
        switch self {
//        case .geometryReader:
//            return LocalizedStringResource("GeometryReader")
//        case .gesture:
//            return LocalizedStringResource("Gestures")
        case .gradient:
            return NSLocalizedString("Gradient", bundle: .module, comment: "Title of Gradient playground")
//        case .graphics:
//            return LocalizedStringResource("Graphics")
//        case .grid:
//            return LocalizedStringResource("Grids")
//        case .hapticFeedback:
//            return LocalizedStringResource("Haptic Feedback")
        case .icon:
            return NSLocalizedString("Icons", bundle: .module, comment: "Title of Icons playground")
        case .image:
            return NSLocalizedString("Image", bundle: .module, comment: "Title of Image playground")
//        case .keyboard:
//            return LocalizedStringResource("Keyboard")
        case .label:
            return NSLocalizedString("Label", bundle: .module, comment: "Title of Label playground")
        case .link:
            return NSLocalizedString("Link", bundle: .module, comment: "Title of Link playground")
//        case .list:
//            return LocalizedStringResource("List")
//        case .localization:
//            return LocalizedStringResource("Localization")
//        case .map:
//            return LocalizedStringResource("Map")
//        case .menu:
//            return LocalizedStringResource("Menu")
//        case .modifier:
//            return LocalizedStringResource("Modifiers")
        case .navigationStack:
            return NSLocalizedString("NavigationStack", bundle: .module, comment: "Title of NavigationStack playground")
        }
    }

    var body: some View {
        switch self {
//        case .geometryReader:
//            GeometryReaderPlayground()
//        case .gesture:
//            GesturePlayground()
        case .gradient:
            GradientPlayground()
//        case .graphics:
//            GraphicsPlayground()
//        case .grid:
//            GridPlayground()
//        case .hapticFeedback:
//            if #available(iOS 17.0, *) {
//                HapticFeedbackPlayground()
//            } else {
//                Text("Haptic Feedback Unavailable in this OS version")
//            }
        case .icon:
            IconPlayground()
        case .image:
            ImagePlayground()
//        case .keyboard:
//            KeyboardPlayground()
        case .label:
            LabelPlayground()
        case .link:
            LinkPlayground()
//        case .list:
//            ListPlayground()
//        case .localization:
//            LocalizationPlayground()
//        case .map:
//            MapPlayground()
//        case .menu:
//            MenuPlayground()
//        case .modifier:
//            ModifierPlayground()
        case .navigationStack:
            NavigationStackPlayground()
        }
    }
}

/// All Showcase playgrounds, part 3.
///
/// We had to divide up the list to prevent Swift compiler type check time errors.
enum PlaygroundType3: CaseIterable, View {
    //    case observable
    case offsetPosition
    case onSubmit
    case overlay
    //    case pasteboard
    case picker
    case progressView
    case redacted
    //    case safeArea
    //    case scenePhase
    case scrollView
    //    case searchable
    case secureField
    //    case shadow
    case shape
    //    case shareLink
    case sheet
    //    case slider
    case spacer
    case stack
    //    case state
    //    case storage
    case symbol

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
//        case .safeArea:
//            return LocalizedStringResource("SafeArea")
//        case .scenePhase:
//            return LocalizedStringResource("ScenePhase")
        case .scrollView:
            return NSLocalizedString("ScrollView", bundle: .module, comment: "Title of ScrollView playground")
//        case .searchable:
//            return LocalizedStringResource("Searchable")
        case .secureField:
            return NSLocalizedString("SecureField", bundle: .module, comment: "Title of SecureField playground")
//        case .shadow:
//            return LocalizedStringResource("Shadow")
        case .shape:
            return NSLocalizedString("Shape", bundle: .module, comment: "Title of Shape playground")
//        case .shareLink:
//            return LocalizedStringResource("ShareLink")
        case .sheet:
            return NSLocalizedString("Sheet", bundle: .module, comment: "Title of Sheet playground")
//        case .slider:
//            return LocalizedStringResource("Slider")
        case .spacer:
            return NSLocalizedString("Spacer", bundle: .module, comment: "Title of Spacer playground")
        case .stack:
            return NSLocalizedString("Stacks", bundle: .module, comment: "Title of Stacks playground")
//        case .state:
//            return LocalizedStringResource("State")
//        case .storage:
//            return LocalizedStringResource("Storage")
        case .symbol:
            return NSLocalizedString("Symbol", bundle: .module, comment: "Title of Symbol playground")
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
//        case .safeArea:
//            SafeAreaPlayground()
//        case .scenePhase:
//            ScenePhasePlayground()
        case .scrollView:
            ScrollViewPlayground()
//        case .searchable:
//            SearchablePlayground()
        case .secureField:
            SecureFieldPlayground()
//        case .shadow:
//            ShadowPlayground()
        case .shape:
            ShapePlayground()
//        case .shareLink:
//            ShareLinkPlayground()
        case .sheet:
            SheetPlayground()
//        case .slider:
//            SliderPlayground()
        case .spacer:
            SpacerPlayground()
        case .stack:
            StackPlayground()
//        case .state:
//            StatePlayground()
//        case .storage:
//            StoragePlayground()
        case .symbol:
            SymbolPlayground()
        }
    }
}

/// All Showcase playgrounds, part 4.
///
/// We had to divide up the list to prevent Swift compiler type check time errors.
enum PlaygroundType4: CaseIterable, View {
//    case table
    case tabView
    case text
    case textEditor
    case textField
    case toggle
    case toolbar
//    case timer
//    case transition
//    case videoPlayer
//    case webView
    case zIndex

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
//        case .timer:
//            return LocalizedStringResource("Timer")
        case .toggle:
            return NSLocalizedString("Toggle", bundle: .module, comment: "Title of Toggle playground")
        case .toolbar:
            return NSLocalizedString("Toolbar", bundle: .module, comment: "Title of Toolbar playground")
//        case .transition:
//            return LocalizedStringResource("Transition")
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
//        case .timer:
//            TimerPlayground()
        case .toggle:
            TogglePlayground()
        case .toolbar:
            ToolbarPlayground()
//        case .transition:
//            TransitionPlayground()
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


