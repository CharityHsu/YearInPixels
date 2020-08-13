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
            
            if collectionV == previousVC.janCV {
                if let cell = previousVC.janCV.cellForItem(at: indexP!) as? CollectionViewCell {

                    cell.myLabel.backgroundColor = sender.backgroundColor
                }
            } else if collectionV == previousVC.febCV {
                if let cell = previousVC.febCV.cellForItem(at: indexP!) as? CollectionViewCell {

                    cell.myLabel.backgroundColor = sender.backgroundColor
                }
            } else if collectionV == previousVC.marCV {
                if let cell = previousVC.marCV.cellForItem(at: indexP!) as? CollectionViewCell {

                    cell.myLabel.backgroundColor = sender.backgroundColor
                }
            } else if collectionV == previousVC.aprCV {
                if let cell = previousVC.aprCV.cellForItem(at: indexP!) as? CollectionViewCell {

                    cell.myLabel.backgroundColor = sender.backgroundColor
                }
            } else if collectionV == previousVC.mayCV {
                if let cell = previousVC.mayCV.cellForItem(at: indexP!) as? CollectionViewCell {

                    cell.myLabel.backgroundColor = sender.backgroundColor
                }
            } else if collectionV == previousVC.junCV {
                if let cell = previousVC.junCV.cellForItem(at: indexP!) as? CollectionViewCell {

                    cell.myLabel.backgroundColor = sender.backgroundColor
                }
            } else if collectionV == previousVC.julCV {
                if let cell = previousVC.julCV.cellForItem(at: indexP!) as? CollectionViewCell {

                    cell.myLabel.backgroundColor = sender.backgroundColor
                }
            } else if collectionV == previousVC.augCV {
                if let cell = previousVC.augCV.cellForItem(at: indexP!) as? CollectionViewCell {

                    cell.myLabel.backgroundColor = sender.backgroundColor
                }
            } else if collectionV == previousVC.sepCV {
                if let cell = previousVC.sepCV.cellForItem(at: indexP!) as? CollectionViewCell {

                    cell.myLabel.backgroundColor = sender.backgroundColor
                }
            } else if collectionV == previousVC.octCV {
                if let cell = previousVC.octCV.cellForItem(at: indexP!) as? CollectionViewCell {

                    cell.myLabel.backgroundColor = sender.backgroundColor
                }
            } else if collectionV == previousVC.novCV {
                if let cell = previousVC.novCV.cellForItem(at: indexP!) as? CollectionViewCell {

                    cell.myLabel.backgroundColor = sender.backgroundColor
                }
            } else {
                if let cell = previousVC.decCV.cellForItem(at: indexP!) as? CollectionViewCell {

                    cell.myLabel.backgroundColor = sender.backgroundColor
                }
            }
            

        }

        self.dismiss(animated: true, completion: nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
