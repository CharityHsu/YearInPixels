//
//  PopupVC.swift
//  YearInPixels
//
//  Created by Charity Hsu on 8/10/20.
//  Copyright © 2020 Charity Hsu. All rights reserved.
//

import UIKit

class PopupVC: UIViewController {
    
    var previousVC = ViewController()
    var IP: IndexPath?
    
    
    @IBOutlet weak var horrible: UIButton!
    @IBOutlet weak var bad: UIButton!
    @IBOutlet weak var okay: UIButton!
    @IBOutlet weak var good: UIButton!
    @IBOutlet weak var great: UIButton!
    
    
    @IBAction func touchColor(_ sender: UIButton) {
        
        let aDay = previousVC.dayDataArray[IP!.section][IP!.item]
        aDay.moodColor = sender.backgroundColor!
        previousVC.janCV.reloadData()
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
