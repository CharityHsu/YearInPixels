//
//  ViewController.swift
//  YearInPixels
//
//  Created by Charity Hsu on 8/9/20.
//  Copyright © 2020 Charity Hsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dayDataArray: [[DayData?]] = []
    
    @IBOutlet weak var janCV: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        dayDataArray = createDays()
    }
    
    func createDays() -> [[DayData?]] {
        
        var arr: [[DayData?]] = []
        
        for month in 0 ..< 12 {
            var temp: [DayData] = []
            for day in 1 ... numDaysInMonth[month] {
                let newDay = DayData()
                newDay.dayNum = day
                temp.append(newDay)
            }
            arr.append(temp)
        }
        
        arr[0].insert(contentsOf: [nil, nil], at: 0)
        arr[1].insert(contentsOf: [nil, nil, nil, nil, nil, nil], at: 0)
        arr[2].insert(contentsOf: [nil, nil], at: 0)
        arr[3].insert(contentsOf: [nil, nil], at: 0)
        arr[4].insert(contentsOf: [nil, nil, nil, nil], at: 0)
        arr[6].insert(contentsOf: [nil, nil], at: 0)
        arr[7].insert(contentsOf: [nil, nil, nil, nil, nil], at: 0)
        arr[8].insert(contentsOf: [nil], at: 0)
        arr[9].insert(contentsOf: [nil, nil, nil], at: 0)
        arr[10].insert(contentsOf: [nil, nil, nil, nil, nil, nil], at: 0)
        arr[11].insert(contentsOf: [nil], at: 0)
        return arr
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numDaysInMonth[section]
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCell", for: indexPath) as! CollectionViewCell
        
        let aDay = dayDataArray[indexPath.section][indexPath.item]
        
        if let myDay = aDay?.dayNum {
            cell.myLabel.text = String(myDay)
            cell.isHidden = false
        } else {
            cell.isHidden = true
        }
        
        cell.myLabel.backgroundColor = aDay?.moodColor
        
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

