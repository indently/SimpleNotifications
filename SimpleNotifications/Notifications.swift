//
//  Notifications.swift
//  SimpleNotifications
//
//  Created by Federico on 30/11/2021.
//

import Foundation
import UserNotifications

class Notifications {
    func askPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("Access granted!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func sendNotification(date: Date) {
        let content = UNMutableNotificationContent()
        content.title = "Epic Notification!"
        content.subtitle = "This came from an epic channel!"
        content.sound = UNNotificationSound.default
        
        // show this notification five seconds from now
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        // DATE TRIGGER
        let dateComponents = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute], from: date)

        // Create the trigger as a repeating event.
        let dateTrigger = UNCalendarNotificationTrigger(
                 dateMatching: dateComponents, repeats: false)

        // choose a random identifier
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: dateTrigger)

        // add our notification request
        UNUserNotificationCenter.current().add(request)
    }
    
}
