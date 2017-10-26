//
//  AppDelegate.swift
//  LearningUserNotifications
//
//  Created by Rommel Rico on 10/26/17.
//  Copyright © 2017 Rommel Rico. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Register ourselves as a delegate so we can be notified when actions pressed
        UNUserNotificationCenter.current().delegate = self
        
        // Request permission
        UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .alert]) {
            granted, error in
            if granted {
                print("Approval granted to send notifications")
            }
        }
        
        self.addCategory()
        
        return true
    }
    
    /**
     Registers a notification category with the UNUserNotificationCenter.
     Enables us to add 'quick actions' users can interact with directly from the notification.
     */
    func addCategory() {
        // Add action
        let cancelAction = UNNotificationAction(identifier: Identifiers.cancelAction,
                                                title: "Cancel",
                                                options: [.foreground])
        
        // Create category
        let category = UNNotificationCategory(identifier: Identifiers.reminderCategory,
                                              actions: [cancelAction],
                                              intentIdentifiers: [],
                                              options: [])
        
        UNUserNotificationCenter.current().setNotificationCategories([category])
    }

}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.actionIdentifier == Identifiers.cancelAction {
            let request = response.notification.request
            print("Removing item with identifier \(request.identifier)")
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [request.identifier])
        }
        
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(.alert)
    }
    
}
