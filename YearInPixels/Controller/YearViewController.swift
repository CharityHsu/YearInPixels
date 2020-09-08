//
//  YearViewController.swift
//  YearInPixels
//
//  Created by Charity Hsu on 9/6/20.
//  Copyright © 2020 Charity Hsu. All rights reserved.
//

import UIKit

class YearViewController: UIViewController {

    @IBOutlet weak var yearCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension YearViewController: UICollectionViewDelegate {
    
}

extension YearViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 31
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "YearCell", for: indexPath)
        
        let actualNumDaysInMonth = numDaysInMonth[indexPath.item] - numIndentedSpaces[indexPath.item]
        
        // if 28 <= 29 - 1
        // if 29 <= 29 - 1
        if indexPath.section <= actualNumDaysInMonth - 1 {
            let indents = numIndentedSpaces[indexPath.item]
            let aDay = dayDataArray[indexPath.item][indexPath.section + indents]

            cell.backgroundColor = aDay.moodColor
        } else {
            cell.backgroundColor = .clear
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let noOfCellsInRow = 12

        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))

        return CGSize(width: size, height: size)
    }
    
}
