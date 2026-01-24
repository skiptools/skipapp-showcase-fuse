// Copyright 2025 Skip
import SwiftUI
import SkipSpeech

/// This component uses the `SkipSpeech` module for cross-platform speech recognition
struct SpeechPlayground: View {
    var body: some View {
        List(SpeechPlaygroundType.allCases, id: \.self) { type in
            NavigationLink(value: type) { Text(type.title) }
        }
        .toolbar {
            PlaygroundSourceLink(file: "SpeechPlayground.swift")
        }
        .navigationDestination(for: SpeechPlaygroundType.self) {
            switch $0 {
            case .basicRecognition:
                BasicRecognitionView()
                    .navigationTitle(Text($0.title))
            case .authorizationStatus:
                AuthorizationStatusView()
                    .navigationTitle(Text($0.title))
            }
        }
    }
}

enum SpeechPlaygroundType: String, CaseIterable {
    case basicRecognition
    case authorizationStatus

    var title: LocalizedStringResource {
        switch self {
        case .basicRecognition: return LocalizedStringResource("Basic Recognition")
        case .authorizationStatus: return LocalizedStringResource("Authorization Status")
        }
    }
}

struct BasicRecognitionView: View {
    @State var recognizer: SFSpeechRecognizer?
    @State var transcription = ""
    @State var isListening = false
    @State var errorMessage: String?
    @State var request: SFSpeechAudioBufferRecognitionRequest?
    @State var task: SFSpeechRecognitionTask?

    var body: some View {
        VStack(spacing: 20) {
            Text("Live Transcription (German)")
                .font(.headline)

            ScrollView {
                Text(transcription.isEmpty ? "Tap Start to begin speaking..." : transcription)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
            }
            .frame(minHeight: 150)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)

            if let error = errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .font(.caption)
            }

            HStack(spacing: 20) {
                Button(isListening ? "Stop" : "Start") {
                    if isListening {
                        stopRecognition()
                    } else {
                        startRecognition()
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(isListening ? .red : .blue)

                Button("Clear") {
                    transcription = ""
                    errorMessage = nil
                }
                .buttonStyle(.bordered)
            }

            HStack {
                Circle()
                    .fill(isListening ? .red : .gray)
                    .frame(width: 10, height: 10)
                Text(isListening ? "Listening..." : "Ready")
                    .foregroundColor(.secondary)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text("Info:")
                    .font(.caption.bold())
                Text("• Uses native Speech framework on iOS")
                Text("• Uses android.speech.SpeechRecognizer on Android")
                Text("• Requires microphone permission")
                Text("• Requires internet connection")
            }
            .font(.caption)
            .foregroundColor(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color.blue.opacity(0.1))
            .cornerRadius(8)
        }
        .padding()
        .onAppear {
            recognizer = SFSpeechRecognizer(locale: Locale(identifier: "de-DE"))
        }
        .onDisappear {
            stopRecognition()
        }
    }

    private func startRecognition() {
        guard let recognizer = recognizer else {
            errorMessage = "Speech recognizer not available"
            return
        }

        guard recognizer.isAvailable else {
            errorMessage = "Speech recognition not available on this device"
            return
        }

        transcription = ""
        errorMessage = nil

        request = SFSpeechAudioBufferRecognitionRequest()
        request?.shouldReportPartialResults = true

        task = recognizer.recognitionTask(with: request!) { result, error in
            DispatchQueue.main.async {
                if let error = error {
                    errorMessage = error.localizedDescription
                    isListening = false
                    return
                }

                if let result = result {
                    transcription = result.bestTranscription.formattedString

                    if result.isFinal {
                        isListening = false
                    }
                }
            }
        }
        isListening = true
    }

    private func stopRecognition() {
        task?.cancel()
        task = nil
        request = nil
        isListening = false
    }
}

struct AuthorizationStatusView: View {
    @State var status: SFSpeechRecognizerAuthorizationStatus = .notDetermined
    @State var recognizer: SFSpeechRecognizer?

    var body: some View {
        VStack(spacing: 20) {
            Text("Speech Recognition Authorization")
                .font(.headline)

            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Authorization Status:")
                    Spacer()
                    Text(statusText)
                        .fontWeight(.semibold)
                        .foregroundColor(statusColor)
                }

                HStack {
                    Text("Speech Available:")
                    Spacer()
                    Text(recognizer?.isAvailable == true ? "Yes" : "No")
                        .fontWeight(.semibold)
                        .foregroundColor(recognizer?.isAvailable == true ? .green : .red)
                }

                HStack {
                    Text("Locale:")
                    Spacer()
                    Text(recognizer?.locale.identifier ?? "N/A")
                        .fontWeight(.semibold)
                }
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)

            Button("Request Authorization") {
                SFSpeechRecognizer.requestAuthorization { newStatus in
                    Task { @MainActor in
                        status = newStatus
                    }
                }
            }
            .buttonStyle(.borderedProminent)

            Button("Refresh Status") {
                status = SFSpeechRecognizer.authorizationStatus()
                recognizer = SFSpeechRecognizer(locale: Locale(identifier: "de-DE"))
            }
            .buttonStyle(.bordered)

            VStack(alignment: .leading, spacing: 4) {
                Text("Authorization States:")
                    .font(.caption.bold())
                Text("• notDetermined: User hasn't been asked yet")
                Text("• authorized: Permission granted")
                Text("• denied: User denied permission")
                Text("• restricted: Device policy restriction")
            }
            .font(.caption)
            .foregroundColor(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color.blue.opacity(0.1))
            .cornerRadius(8)
        }
        .padding()
        .onAppear {
            recognizer = SFSpeechRecognizer(locale: Locale(identifier: "de-DE"))
            status = SFSpeechRecognizer.authorizationStatus()
        }
    }

    var statusText: String {
        switch status {
        case .notDetermined: return "Not Determined"
        case .denied: return "Denied"
        case .restricted: return "Restricted"
        case .authorized: return "Authorized"
        @unknown default: return "Unknown"
        }
    }

    var statusColor: Color {
        switch status {
        case .authorized: return .green
        case .denied, .restricted: return .red
        default: return .orange
        }
    }
}
