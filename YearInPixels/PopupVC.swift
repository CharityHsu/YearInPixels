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
        
        if let cell = previousVC.janCV?.cellForItem(at: IP!) as? CollectionViewCell {
            cell.myLabel.backgroundColor = sender.backgroundColor
        }
        
        let aDay = dayDataArray[IP!.section][IP!.item]
        aDay?.moodColor = getStringFromUIColor(color: sender.backgroundColor!.resolvedColor(with: view.traitCollection))
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
    
    func getStringFromUIColor(color: UIColor) -> String {
        switch color {
        case UIColor.systemRed.resolvedColor(with: view.traitCollection):
            return "horrible"
        case UIColor.systemOrange.resolvedColor(with: view.traitCollection):
            return "bad"
        case UIColor.systemYellow.resolvedColor(with: view.traitCollection):
            return "okay"
        case UIColor.systemGreen.resolvedColor(with: view.traitCollection):
            return "good"
        case UIColor.systemPurple.resolvedColor(with: view.traitCollection):
            return "great"
        default:
            return "blah"
        }
    }

}
