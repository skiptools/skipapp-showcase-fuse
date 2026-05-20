// Copyright 2023–2026 Skip
import Foundation
import SwiftUI
import SkipOSLogStore
#if os(Android)
import AndroidLogging
#endif

let category = "OSLogStorePlayground"
let osLogStoreLogger = Logger(subsystem: "showcase.app", category: category)

struct OSLogStorePlayground: View {
    @State var minutes: Int = 1
    @State var selectedMinimumLevel: OSLogEntryLog.Level = .notice
    @State var showPlaygroundEntriesOnly = true

    var body: some View {
        List {
            Section("Write Logs") {
                Button("Log Default") {
                    osLogStoreLogger.log("OSLogStorePlayground default \(UUID().uuidString)")
                }
                Button("Log Trace") {
                    osLogStoreLogger.trace("OSLogStorePlayground trace \(UUID().uuidString)")
                }
                Button("Log Debug") {
                    osLogStoreLogger.debug("OSLogStorePlayground debug \(UUID().uuidString)")
                }
                Button("Log Info") {
                    osLogStoreLogger.info("OSLogStorePlayground info \(UUID().uuidString)")
                }
                Button("Log Notice") {
                    osLogStoreLogger.notice("OSLogStorePlayground notice \(UUID().uuidString)")
                }
                Button("Log Warning") {
                    osLogStoreLogger.warning("OSLogStorePlayground warning \(UUID().uuidString)")
                }
                Button("Log Error") {
                    osLogStoreLogger.error("OSLogStorePlayground error \(UUID().uuidString)\n----- multiline")
                }
                // These will Log.wtf which can crash the app
                Button("Log Critical") {
                    osLogStoreLogger.critical("OSLogStorePlayground critical \(UUID().uuidString)")
                }
                Button("Log Fault") {
                    osLogStoreLogger.fault("OSLogStorePlayground fault \(UUID().uuidString)")
                }
            }

            Section("Read Filters") {
                Picker("Minimum Level", selection: $selectedMinimumLevel) {
                    ForEach(LogLevelChoice.allCases) { choice in
                        Text(choice.title).tag(choice.level)
                    }
                }

                Toggle("Show Playground entries only", isOn: $showPlaygroundEntriesOnly)

                HStack {
                    Text("Minutes: \(minutes)")
                    Spacer()
                    Button("-") {
                        minutes = max(1, minutes - 1)
                    }
                    .buttonStyle(.bordered)
                    Button("+") {
                        minutes = min(60, minutes + 1)
                    }
                    .buttonStyle(.bordered)
                }
            }

            Section {
                NavigationLink("Show Logs") {
                    OSLogStoreLogListView(
                        minutes: minutes,
                        minimumLevel: selectedMinimumLevel,
                        showPlaygroundEntriesOnly: showPlaygroundEntriesOnly
                    )
                }
            } footer: {
                Text("Predicate filtering is not implemented yet, so minimum level filtering is applied client-side.")
            }
        }
        .toolbar {
            PlaygroundSourceLink(file: "OSLogStorePlayground.swift")
        }
    }
}

enum LogLevelChoice: String, CaseIterable, Identifiable {
    case debug
    case info
    case notice
    case error
    case fault

    var id: String { rawValue }

    var title: String {
        rawValue.capitalized
    }

    var level: OSLogEntryLog.Level {
        switch self {
        case .debug:
            return .debug
        case .info:
            return .info
        case .notice:
            return .notice
        case .error:
            return .error
        case .fault:
            return .fault
        }
    }
}

struct OSLogStoreLogListView: View {
    let minutes: Int
    let minimumLevel: OSLogEntryLog.Level
    let showPlaygroundEntriesOnly: Bool

    @State var entries: [SkipOSLogStoreEntry] = []
    @State var errorMessage: String?
    @State var isLoading = false

    var body: some View {
        List {
            if let errorMessage {
                Section("Error") {
                    Text(errorMessage)
                        .foregroundStyle(.red)
                }
            }

            Section("Logs") {
                if isLoading {
                    HStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                } else if entries.isEmpty {
                    Text("No logs found")
                        .foregroundStyle(.secondary)
                } else {
                    ForEach(0..<entries.count) { index in
                        let entry = entries[index]
                        VStack(alignment: .leading, spacing: 4) {
                            Text("\(Self.timestampFormatter.string(from: entry.date)) [\(Self.label(for: entry.level))]")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            Text("category: \(entry.category)")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            Text(entry.composedMessage)
                                .font(.body.monospaced())
                        }
                    }
                }
            }
        }
        .navigationTitle("OSLogStore Logs")
        .toolbar {
            Button("Refresh") {
                Task {
                    await loadEntries()
                }
            }
        }
        .task {
            await loadEntries()
        }
    }

    func loadEntries() async {
        isLoading = true
        defer { isLoading = false }

        let minutes = self.minutes
        let minimumLevel = self.minimumLevel
        let showPlaygroundEntriesOnly = self.showPlaygroundEntriesOnly
        do {
            let fromDate = Date.now.addingTimeInterval(TimeInterval(-minutes * 60))
            let fetchedEntries = try await SkipOSLogStore.getEntries(
                after: fromDate,
                minimumLevel: minimumLevel,
                inCategory: showPlaygroundEntriesOnly ? category : nil
            )

            self.entries = fetchedEntries
            self.errorMessage = nil
        } catch {
            self.entries = []
            self.errorMessage = error.localizedDescription
            osLogStoreLogger.error("OSLogStorePlayground failed to fetch logs: \(error)")
        }
    }

    static let timestampFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        return formatter
    }()

    static func label(for level: OSLogEntryLog.Level) -> String {
        switch level {
        case .debug:
            return "DEBUG"
        case .info:
            return "INFO"
        case .notice:
            return "NOTICE"
        case .error:
            return "ERROR"
        case .fault:
            return "FAULT"
        case .undefined:
            return "UNDEFINED"
        @unknown default:
            return "UNKNOWN"
        }
    }
}
