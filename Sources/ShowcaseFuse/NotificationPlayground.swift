// Copyright 2023–2025 Skip
import SwiftUI
import SkipKit
import SkipNotify

struct NotificationPlayground: View {
    @State var token: String = ""
    @State var notificationPermission: String = ""

    var body: some View {
        VStack {
            Button("Request Push Notification Permission") {
                Task { @MainActor in
                    do {
                        self.notificationPermission = try await PermissionManager.requestPostNotificationPermission(alert: true, sound: false, badge: true).rawValue
                        logger.log("obtained push notification permission: \(self.notificationPermission)")
                    } catch {
                        logger.error("error obtaining push notification permission: \(error)")
                        self.notificationPermission = "error: \(error)"
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.indigo)

            Text("Permission Status: \(notificationPermission)")
                .task {
                    self.notificationPermission = await PermissionManager.queryPostNotificationPermission().rawValue
                }

            Divider()

            HStack {
                TextField("Push Notification Client Token", text: $token)
                    .textFieldStyle(.roundedBorder)
                Button("Copy") {
                    UIPasteboard.general.string = token
                }
                .buttonStyle(.automatic)
            }

            Button("Generate Push Notification Token") {
                Task { @MainActor in
                    do {
                        self.token = try await SkipNotify.shared.fetchNotificationToken()
                        logger.log("obtained push notification token: \(self.token)")
                    } catch {
                        logger.error("error obtaining push notification token: \(error)")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
