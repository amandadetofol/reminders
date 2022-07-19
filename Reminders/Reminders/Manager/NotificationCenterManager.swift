//
//  NotificationCenterManager.swift
//  Reminders
//
//  Created by Amanda Detofol on 15/07/22.
//

import UserNotifications

class NotificationCenterManager {
    
    let userNotificationCenter = UNUserNotificationCenter.current()
    private let notificationId: String = "notificationId"
    
    func sendNotification(title: String, description: String, date: Date){
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = title
        notificationContent.body = description
        notificationContent.badge = NSNumber(value: 3)
        
        if let url = Bundle.main.url(forResource: "dune",
                                     withExtension: "png") {
            if let attachment = try? UNNotificationAttachment(identifier: "dune",
                                                              url: url,
                                                              options: nil) {
                notificationContent.attachments = [attachment]
            }
        }
        
        let elapseTimeInSeconds = date.timeIntervalSince(Date())
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: elapseTimeInSeconds,
                                                        repeats: false)
        
        let request = UNNotificationRequest(identifier: notificationId,
                                            content: notificationContent,
                                            trigger: trigger)
        
        userNotificationCenter.add(request) { (error) in
            if let error = error {
                print("Notification Error: ", error)
            }
        }
    }
    
    func requestNotificationAuthorization() {
        let authOptions = UNAuthorizationOptions.init(arrayLiteral: .alert, .badge, .sound)
        self.userNotificationCenter.requestAuthorization(options: authOptions) { (success, error) in
            if let error = error {
                print("An error ocurred: ", error)
            }
        }
    }

}
