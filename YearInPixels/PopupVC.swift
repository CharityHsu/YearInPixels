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
    var indexPath: IndexPath?
    
    @IBOutlet var moodButtons: [UIButton]!
    @IBOutlet weak var okayButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    var currentColor: UIColor = .systemYellow
    
    @IBAction func touchColor(_ sender: UIButton) {
        moodButtons.forEach({ $0.layer.borderWidth = 1.5 })
        sender.layer.borderWidth = 5.0
        currentColor = sender.backgroundColor!
    }
    
    
    @IBAction func saveButton(_ sender: UIButton) {
        if let cell = previousVC.janCV?.cellForItem(at: indexPath!) as? CollectionViewCell {
            cell.myLabel.backgroundColor = currentColor
        }
        
        dayDataArray[indexPath!.section][indexPath!.item].moodColor = getStringFromUIColor(color: currentColor.resolvedColor(with: view.traitCollection))
        
        //if textView.text.count > 0 {
            dayDataArray[indexPath!.section][indexPath!.item].description = textView.text
        //}
        DayData.saveToFile(days: dayDataArray)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moodButtons.forEach({
            $0.layer.borderColor = UIColor.black.cgColor
            $0.layer.borderWidth = 1.5
        })
        
        textView.placeholder = "Write something about it (optional)"
        textView.textContainerInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
        
        if let moodColor = dayDataArray[indexPath!.section][indexPath!.item].moodColor {
            moodButtons.forEach({
                if getStringFromUIColor(color: $0.backgroundColor!.resolvedColor(with: view.traitCollection)) == moodColor {
                    currentColor = $0.backgroundColor!
                    $0.layer.borderWidth = 5.0
                }
            })
        } else {
            okayButton.layer.borderWidth = 5.0
            okayButton.layer.borderColor = UIColor.black.cgColor
        }
        
        if let description = dayDataArray[indexPath!.section][indexPath!.item].description,
            description != ""
            {
            textView.placeholder = ""
            textView.text = description
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


