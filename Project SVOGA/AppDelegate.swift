//
//  AppDelegate.swift
//  Project SVOGA
//
//  Created by ROMYCH on 01.12.18.
//  Copyright © 2018 Romych. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    let notifyDate = DataNotify()
    let notificationCenter = UNUserNotificationCenter.current()
    
    func applicationWillTerminate(_ application: UIApplication) {
        self.saveContext()
    }
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
       
        return true
    }
    
    func scheduleNotification() {
        
        let content = UNMutableNotificationContent()
        
        content.title = "Hello"
        content.body = "Do you want to add new data?"
        
        
        content.sound = UNNotificationSound.criticalSoundNamed("some.caf")
        
        content.badge = 1
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd"
        let todayStr = dateFormater.string(from: Date())
        // print(Date())
        // print("day = \(todayStr)")
        dateFormater.dateFormat = "dd H:mm"
        print(todayStr)
        let fullDate = "\(todayStr) \(notifyDate.getNotifyDate())"
        let date = dateFormater.date(from: fullDate)
        
        let triggerDate = Calendar.current.dateComponents([.hour,.minute], from: date ?? Date.init())
        //print(triggerDate)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: true)
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let identifier = "Local Notification"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        notificationCenter.add(request) { (error) in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        UIApplication.shared.applicationIconBadgeNumber = 0
    }
}

