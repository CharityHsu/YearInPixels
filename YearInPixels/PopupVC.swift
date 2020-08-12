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
            } else {
                if let cell = previousVC.febCV.cellForItem(at: indexP!) as? CollectionViewCell {

                    cell.myLabel.backgroundColor = sender.backgroundColor
                }
            }
            

        }

        self.dismiss(animated: true, completion: nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
