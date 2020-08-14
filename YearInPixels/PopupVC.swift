//
//  PopupVC.swift
//  YearInPixels
//
//  Created by Charity Hsu on 8/10/20.
//  Copyright © 2020 Charity Hsu. All rights reserved.
//

import UIKit
import CoreData

class PopupVC: UIViewController {
    
    var previousVC = ViewController()
    var senderInfo : Sender?
    
    
    @IBOutlet weak var horrible: UIButton!
    @IBOutlet weak var bad: UIButton!
    @IBOutlet weak var okay: UIButton!
    @IBOutlet weak var good: UIButton!
    @IBOutlet weak var great: UIButton!
    
    
    
    
    @IBAction func touchColor(_ sender: UIButton) {
        
        if let segueSender = senderInfo {
            let collectionV = segueSender.CV
            let indexP = segueSender.IP
            
            if let cell = collectionV?.cellForItem(at: indexP!) as? CollectionViewCell {
                
//                guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//                  return
//                }
//
//                let context = appDelegate.persistentContainer.viewContext
//
//                let day = Day(context: context)
//
//                day.moodColor = "blue"
//
//                appDelegate.saveContext()
                
                cell.myLabel.backgroundColor = sender.backgroundColor
            }
        }

        self.dismiss(animated: true, completion: nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttons = [self.horrible, self.bad, self.okay, self.good, self.great]
        
        for button in buttons {
            button?.layer.borderWidth = 3.0
            button?.layer.borderColor = UIColor.black.cgColor
        }

    }

}
