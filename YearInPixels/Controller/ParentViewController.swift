//
//  ParentViewController.swift
//  YearInPixels
//
//  Created by Charity Hsu on 9/6/20.
//  Copyright © 2020 Charity Hsu. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var monthView: UIView!
    @IBOutlet weak var yearView: UIView!
    
    // MARK: - Properties
    var yearVC: YearViewController?
    
    // MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        monthView.alpha = 1.0
        yearView.alpha = 0.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "YearEmbedSegue" {
            if let vc = segue.destination as? YearViewController {
                self.yearVC = vc
            }
        } else if segue.identifier == "moveToReminder" {
            playSound()
        }
    }

    // MARK: - Actions
    
    @IBAction func didTapSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            monthView.alpha = 1.0
            yearView.alpha = 0.0
        case 1:
            yearVC?.yearCollectionView.reloadData()
            yearView.alpha = 1.0
            monthView.alpha = 0.0
        default:
            break
        }
    }
    
    
}
