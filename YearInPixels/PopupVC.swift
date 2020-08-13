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
    var senderInfo : Sender?
    
    @IBAction func touchColor(_ sender: UIButton) {
        
        if let segueSender = senderInfo {
            let collectionV = segueSender.CV
            let indexP = segueSender.IP
            
            if let cell = collectionV?.cellForItem(at: indexP!) as? CollectionViewCell {
                cell.myLabel.backgroundColor = sender.backgroundColor
            }
        }

        self.dismiss(animated: true, completion: nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
