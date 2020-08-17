//
//  Constants.swift
//  YearInPixels
//
//  Created by Charity Hsu on 8/12/20.
//  Copyright © 2020 Charity Hsu. All rights reserved.
//

import Foundation

let monthNames = ["JANUARY", "FEBRUARY", "MARCH", "APRIL", "MAY", "JUNE", "JULY", "AUGUST", "SEPTEMBER", "OCTOBER", "NOVEMBER", "DECEMBER"]

let numDaysInMonth = [33, 37, 33, 32, 35, 30, 33, 35, 31, 34, 36, 32]


class ItemStore {
    
    // var dayDataArray = [[DayData?]]()
    
    let itemArchiveURL: URL = {
        let documentsDirectories =
            FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("items.archive")
    }()
    
//    init() {
//        if let data = try? Data(contentsOf: itemArchiveURL) {
//            let archivedItems = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [[DayData?]]
//            dayDataArray = archivedItems!
//            print("Loaded Archive file")
//        } else {
//            print("Loading Archive file failed or there's no file to load")
//        }
//    }
    
    init() {
        if let data = try? Data(contentsOf: itemArchiveURL) {
            if let archivedData = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [[DayData]] {
                dayDataArray = archivedData
                print("what heppening")
            }
        }else {
            print("cry")
        }
    }
    
    func saveChanges() -> Bool {
        print("Saving items to \(itemArchiveURL.path)")
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: dayDataArray, requiringSecureCoding: false)
            try data.write(to: itemArchiveURL)
            return true
        } catch {
            return false
        }
    }
    
}





