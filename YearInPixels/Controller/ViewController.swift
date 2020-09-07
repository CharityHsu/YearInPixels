//
//  ViewController.swift
//  YearInPixels
//
//  Created by Charity Hsu on 8/9/20.
//  Copyright © 2020 Charity Hsu. All rights reserved.
//

import AVFoundation
import UIKit

var player: AVAudioPlayer?
var dayDataArray: [[DayData]] = []
var dayArray: [[Int?]] = []

func playSound() {
    let urlString = Bundle.main.path(forResource: "button_tap", ofType: "mp3")
    
    do {
        try AVAudioSession.sharedInstance().setMode(.default)
        try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
        
        guard let urlString = urlString else {
            return
        }
        
        player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
        
        guard let player = player else {
            return
        }
        player.play()
        
    } catch {
        print("something went wrong")
    }
}


class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        dayArray = setDayArray()
        
        if let loadedDays = DayData.loadFromFile() {
            dayDataArray = loadedDays
        } else {
            dayDataArray = createDays()
            print("no files were loaded")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        let indexPath = IndexPath(item: 0, section: 8)
//        self.collectionView.scrollToItem(at: indexPath, at: [.centeredVertically, .centeredHorizontally], animated: true)
//    }
    
    func createDays() -> [[DayData]] {
        var arr: [[DayData]] = []
        
        for month in 0 ..< 12 {
            var temp: [DayData] = []
            for _ in 1 ... numDaysInMonth[month] {
                let newDay = DayData()
                temp.append(newDay)
            }
            arr.append(temp)
        }
        return arr
    }
    
    func setDayArray() -> [[Int?]] {
        var arr: [[Int?]] = []
        
        for month in 0 ..< 12 {
            var temp: [Int] = []
            for day in 1 ... numDaysInMonth[month] {
                temp.append(day)
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
    
    @IBAction func didTapClock(_ sender: UIButton) {
        playSound()
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numDaysInMonth[section]
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCell", for: indexPath) as! CollectionViewCell
        
        let aDay = dayDataArray[indexPath.section][indexPath.item]
        let aDayInt = dayArray[indexPath.section][indexPath.item]
        
        if let myDay = aDayInt {
            cell.myLabel.text = String(myDay)
            cell.isHidden = false
        } else {
            cell.isHidden = true
        }

        cell.myLabel.backgroundColor = aDay.moodColor
        
        return cell
    }
    
    // SECTION HEADER
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeaderView", for: indexPath) as! SectionHeaderView
        
        let month = monthNames[indexPath.section]
        
        sectionHeaderView.title = month
        
        return sectionHeaderView
    }
    
    // ALWAYS SHOW 7 CELLS PER ROW
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let noOfCellsInRow = 7

        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))

        return CGSize(width: size, height: size)
    }
    
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        playSound()
        performSegue(withIdentifier: "showPopup", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showPopup" {
            let controller = segue.destination as! PopupVC
            let indexPath = sender as! IndexPath
            controller.previousVC = self
            controller.indexPath = indexPath
        }
        
    }
    
}

//extension ViewController: UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let cellSize = collectionView.frame.size.width / 7
//        return CGSize(width: cellSize, height: cellSize)
//    }
//
//}
