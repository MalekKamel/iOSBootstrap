
import UserNotifications

public class AppNotifications {

    public static func offlineSessionsProcessed() {
        let content = UNMutableNotificationContent()
        content.title = ""
        content.body = ""
        content.sound = UNNotificationSound.default

        // TODO show saved session view controller when click the notification
        appNotificationCenter.add(content: content, identifier: .offlineSessionProcessed)
    }
}
