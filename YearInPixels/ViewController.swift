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

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return days.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return numDaysInMonth[section]
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JanCell", for: indexPath) as! CollectionViewCell
        
        
        cell.myLabel.text = days[indexPath.section][indexPath.item]
        cell.myLabel.backgroundColor = cell.moodColor
        
        if cell.myLabel.text == "@" {
            cell.isHidden = true
        } else {
            cell.isHidden = false
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeaderView", for: indexPath) as! SectionHeaderView
        
        let month = months[indexPath.section]
        
        sectionHeaderView.title = month
        
        return sectionHeaderView
    }
    
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showPopup", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showPopup" {
            let controller = segue.destination as! PopupVC
            let indexPath = sender as! IndexPath
            controller.previousVC = self
            controller.IP = indexPath
        }
        
    }
    
}

