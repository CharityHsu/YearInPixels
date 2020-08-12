//
//  ViewController.swift
//  YearInPixels
//
//  Created by Charity Hsu on 8/9/20.
//  Copyright © 2020 Charity Hsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var janCV: UICollectionView!
    @IBOutlet weak var febCV: UICollectionView!
    
    let jan = [" ", " ", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"]
    
    let feb = [" ", " ", " ", " ", " ", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == janCV {
            return jan.count
        } else {
            return feb.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == janCV {
            let janCell = collectionView.dequeueReusableCell(withReuseIdentifier: "JanCell", for: indexPath) as! CollectionViewCell
            
            janCell.myLabel.text = jan[indexPath.item]
            
            if janCell.myLabel.text == " " {
                janCell.isHidden = true
            }
            return janCell
        } else {
            let febCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FebCell", for: indexPath) as! CollectionViewCell
            
            febCell.myLabel.text = feb[indexPath.item]
            
            if febCell.myLabel.text == " " {
                febCell.isHidden = true
            }
            return febCell
        }
        
    }
    
    
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let itemInfo = Sender(CV: collectionView, IP: indexPath)

        performSegue(withIdentifier: "showPopup", sender: itemInfo)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showPopup" {
            if let itemInfo = sender as? Sender {
                let controller = segue.destination as! PopupVC
                
                controller.previousVC = self
                controller.senderInfo = itemInfo
            }
        }
        
    }
    
    
    
}

