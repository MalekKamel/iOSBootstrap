
import UserNotifications

public let appNotificationCenter = AppNotificationCenter()

public class AppNotificationCenter: NSObject {
   private let center = UNUserNotificationCenter.current()

    public static func setup() {
        appNotificationCenter.center.delegate = appNotificationCenter
        appNotificationCenter.requestPermission()
    }

    public func requestPermission(completion:  ((Bool, Error?) -> Void)? = nil) {
        let options: UNAuthorizationOptions = [.alert, .sound];
        center.requestAuthorization(options: options) {  (granted, error) in
            completion?(granted, error)
            error?.logAndReport()
        }
    }

    public func add(
            content: UNMutableNotificationContent,
            identifier: NotificationIdentifier,
            date: DateComponents? = nil,
            repeats: Bool = false,
            completion: ((Error?) -> Void)? = nil
    ) {
        let triggerDate = date ?? Calendar.current.dateComponents([.hour,.minute,.second], from: Date(timeIntervalSinceNow: 1))

        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: repeats)

        let request = UNNotificationRequest(
                identifier: identifier.rawValue,
                content: content,
                trigger: trigger
        )

        center.add(request, withCompletionHandler: { (error) in
            completion?(error)
            error?.logAndReport()
        })
    }
}

extension AppNotificationCenter: UNUserNotificationCenterDelegate {

    public func userNotificationCenter(
            _ center: UNUserNotificationCenter,
            didReceive response: UNNotificationResponse,
            withCompletionHandler completionHandler: @escaping () -> ()) {
        completionHandler()
    }

    public func userNotificationCenter(
            _ center: UNUserNotificationCenter,
            openSettingsFor notification: UNNotification?) {
    }

    public func userNotificationCenter(
            _ center: UNUserNotificationCenter,
            willPresent notification: UNNotification,
            withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> ()) {
        completionHandler([.alert,.sound])
    }
}

public enum NotificationIdentifier: String {
    case offlineSessionProcessed = "com.rdi.hafs.offline.session.processed"
}
