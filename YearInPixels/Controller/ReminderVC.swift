//
//  ReminderVC.swift
//  YearInPixels
//
//  Created by Charity Hsu on 9/6/20.
//  Copyright © 2020 Charity Hsu. All rights reserved.
//

import UIKit
import UserNotifications

class ReminderVC: UIViewController {

    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        
        switchButton.isOn = UserDefaults.standard.bool(forKey: "switchState")
        if let notificationTime = UserDefaults.standard.object(forKey: "notificationTime") as? Date {
            datePicker.date = notificationTime
        }
    }
    
    @IBAction func didTapCancel(_ sender: UIButton) {
        playSound()
        
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func didTapSave(_ sender: UIButton) {
        playSound()
        
        UserDefaults.standard.set(switchButton.isOn, forKey: "switchState")
        UserDefaults.standard.set(datePicker.date, forKey: "notificationTime")
        
        if switchButton.isOn {
            scheduleNotification(datePicker.date)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    

    func scheduleNotification(_ notificationTime: Date) {
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        
        // Ask for permission
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            // completion
        }
        
        // Create notification content
        let content = UNMutableNotificationContent()
        content.title = "Year In Pixels"
        content.sound = .default
        content.body = "How was your day today?"
        
        // Create trigger
        var dateComponents = DateComponents()
        let calendar = Calendar.current
        
        dateComponents.hour = calendar.component(.hour, from: notificationTime)
        dateComponents.minute = calendar.component(.minute, from: notificationTime)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // Create request
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        // Register request with Notification Center
        center.add(request)
    }
   

}
