////
////  LocalNotificationHelper.swift
////  Project SVOGA
////
////  Created by Roman Storozhenko on 1/7/19.
////  Copyright © 2019 Romych. All rights reserved.
////
//
//import UIKit
//import UserNotifications
//class LocalNotificationHelper: UIViewController  {
//    
//    let center = UNUserNotificationCenter.current()
//    var dateComponents = DateComponents()
//      override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
//            if granted {
//                print("Yay!")
//            } else {
//                print("D'oh")
//            }
//        }
//        
//    }
//    func scheduleNotification() {
//        let center = UNUserNotificationCenter.current()
//        
//        let content = UNMutableNotificationContent()
//        content.title = "Late wake up call"
//        content.body = "The early bird catches the worm, but the second mouse gets the cheese."
//        content.categoryIdentifier = "alarm"
//        content.userInfo = ["customData": "fizzbuzz"]
//        content.sound = UNNotificationSound.default()
//        
//        var dateComponents = DateComponents()
//        dateComponents.hour = 13
//        dateComponents.minute = 13
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
//        
//        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//        center.add(request)
//    }
//    
//    
//}
