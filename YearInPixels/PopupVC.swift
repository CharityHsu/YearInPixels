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
    
    @IBOutlet weak var dateLabel: UILabel!
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
        if let cell = previousVC.collectionView?.cellForItem(at: indexPath!) as? CollectionViewCell {
            cell.myLabel.backgroundColor = currentColor
        }
        
        dayDataArray[indexPath!.section][indexPath!.item].moodColor = getStringFromUIColor(color: currentColor.resolvedColor(with: view.traitCollection))
        
        dayDataArray[indexPath!.section][indexPath!.item].description = textView.text
        
        DayData.saveToFile(days: dayDataArray)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        showAlert()
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Delete this day's data?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in } ))
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (action) in
            if let cell = self.previousVC.collectionView?.cellForItem(at: self.indexPath!) as? CollectionViewCell {
                cell.myLabel.backgroundColor = .lightGray
            }
            dayDataArray[self.indexPath!.section][self.indexPath!.item].moodColor = nil
            dayDataArray[self.indexPath!.section][self.indexPath!.item].description = nil
            DayData.saveToFile(days: dayDataArray)
            self.dismiss(animated: true, completion: nil)
        }))
        present(alert, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDateLabel()
        moodButtons.forEach({
            $0.layer.borderColor = UIColor.black.cgColor
            $0.layer.borderWidth = 1.5
        })
        
        if let description = dayDataArray[indexPath!.section][indexPath!.item].description,
            description != ""
            {
            textView.text = description
        }
        
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
        
        adjustTextView()
    }
    
    func configureDateLabel() {
        
        if let cell = previousVC.collectionView?.cellForItem(at: indexPath!) as? CollectionViewCell {
            let day = cell.myLabel.text
            dateLabel.text = "\(monthNames[indexPath!.section]) \(day!)"
        }
    }
    
    func adjustTextView() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }

        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)

        if notification.name == UIResponder.keyboardWillHideNotification {
            textView.contentInset = .zero
        } else {
            textView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - view.safeAreaInsets.bottom, right: 0)
        }

        textView.scrollIndicatorInsets = textView.contentInset

        let selectedRange = textView.selectedRange
        textView.scrollRangeToVisible(selectedRange)
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


