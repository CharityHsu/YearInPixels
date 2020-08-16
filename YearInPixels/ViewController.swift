//
//  ViewController.swift
//  YearInPixels
//
//  Created by Charity Hsu on 8/9/20.
//  Copyright © 2020 Charity Hsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dayDataArray: [[DayData]] = []
    
    @IBOutlet weak var janCV: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        dayDataArray = createDays()
    }
    
    func createDays() -> [[DayData]] {
        
        var arr: [[DayData]] = []
        
        for month in 0 ..< months.count {
            var temp: [DayData] = []
            for day in 1 ... months[month].count {
                let newDay = DayData()
                newDay.dayNum = day
                temp.append(newDay)
            }
            arr.append(temp)
        }
        
        arr[0].insert(contentsOf: [DayData(), DayData()], at: 0)
        arr[1].insert(contentsOf: [DayData(), DayData(), DayData(), DayData(), DayData(), DayData()], at: 0)
        arr[2].insert(contentsOf: [DayData(), DayData()], at: 0)
        arr[3].insert(contentsOf: [DayData(), DayData()], at: 0)
        arr[4].insert(contentsOf: [DayData(), DayData(), DayData(), DayData()], at: 0)
        arr[6].insert(contentsOf: [DayData(), DayData()], at: 0)
        arr[7].insert(contentsOf: [DayData(), DayData(), DayData(), DayData(), DayData()], at: 0)
        arr[8].insert(contentsOf: [DayData()], at: 0)
        arr[9].insert(contentsOf: [DayData(), DayData(), DayData()], at: 0)
        arr[10].insert(contentsOf: [DayData(), DayData(), DayData(), DayData(), DayData(), DayData()], at: 0)
        arr[11].insert(contentsOf: [DayData()], at: 0)
        return arr
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return months.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return months[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCell", for: indexPath) as! CollectionViewCell
        
        let aDay = dayDataArray[indexPath.section][indexPath.item]
        
        cell.myLabel.text = String(aDay.dayNum)
        cell.myLabel.backgroundColor = aDay.moodColor
        
        if cell.myLabel.text == "0" {
            cell.isHidden = true
        } else {
            cell.isHidden = false
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeaderView", for: indexPath) as! SectionHeaderView
        
        let month = monthNames[indexPath.section]
        
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

