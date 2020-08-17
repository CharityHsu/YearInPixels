//
//  DayData.swift
//  YearInPixels
//
//  Created by Charity Hsu on 8/13/20.
//  Copyright © 2020 Charity Hsu. All rights reserved.
//

import UIKit

class DayData: NSObject, NSCoding {
    
    var dayNum : Int = 0
    var moodColor : UIColor = .lightGray
    var journalEntry : String? = nil
    
    init(color: UIColor) {
        moodColor = color
    }

    func encode(with coder: NSCoder) {
        coder.encode(moodColor, forKey: "moodColor")
    }

    required init(coder: NSCoder) {
        moodColor = coder.decodeObject(forKey: "moodColor") as! UIColor
        super.init()
    }
}
