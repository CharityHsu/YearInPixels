//
//  SectionHeaderView.swift
//  YearInPixels
//
//  Created by Charity Hsu on 8/14/20.
//  Copyright © 2020 Charity Hsu. All rights reserved.
//

import Foundation
import UIKit

class SectionHeaderView: UICollectionReusableView {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var title: String! {
        didSet {
            titleLabel.text = title
        }
    }
    
    
}
