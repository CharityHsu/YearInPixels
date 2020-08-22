//
//  DayData.swift
//  YearInPixels
//
//  Created by Charity Hsu on 8/13/20.
//  Copyright © 2020 Charity Hsu. All rights reserved.
//

import UIKit
import Foundation

class DayData: Codable {
    
    var moodColor: String?
    
    static let documentsDirectory =
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("days").appendingPathExtension("plist")

    static func saveToFile(days: [[DayData]]) {
        do {
            let propertyListEncoder = PropertyListEncoder()
            let encodedDays = try propertyListEncoder.encode(days)
            try encodedDays.write(to: archiveURL,
            options: .noFileProtection)
        } catch {
            print("in catch block")
            print(error)
        }
    }

    static func loadFromFile() -> [[DayData]]? {
        
        do {
            let propertyListDecoder = PropertyListDecoder()
            let retrievedDayData = try Data(contentsOf: archiveURL)
            let decodedDays = try propertyListDecoder.decode(Array<Array<DayData>>.self, from:
                  retrievedDayData)
            return decodedDays
        } catch {
            print(error)
        }
        return nil
    }


}
