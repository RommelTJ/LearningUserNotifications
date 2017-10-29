//
//  NotificationViewController.swift
//  LearningUserNotificationsContentExtension
//
//  Created by Rommel Rico on 10/28/17.
//  Copyright © 2017 Rommel Rico. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
        self.label?.text = notification.request.content.body
    }

}
