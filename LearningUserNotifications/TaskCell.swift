//
//  TaskCell.swift
//  LearningUserNotifications
//
//  Created by Rommel Rico on 10/26/17.
//  Copyright © 2017 Rommel Rico. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var toggleReminderButton: UIButton!
    
    var onButtonSelection: (() -> ())?
    
    @IBAction func remindButtonTapped(_ sender: UIButton) {
        onButtonSelection?()
    }
    
    func showReminderOnIcon() {
        toggleReminderButton.setTitle("🔊", for: .normal)
    }
    
    func showReminderOffIcon() {
        toggleReminderButton.setTitle("🔇", for: .normal)
    }

}
