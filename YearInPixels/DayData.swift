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
    
    // added enum, changed moodColor to UIColor, added 2 init and 1 encode function
    
    private enum CodingKeys: String, CodingKey { case moodColor, description }
    
    var moodColor: UIColor?
    var description: String?
    
    static let documentsDirectory =
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("days").appendingPathExtension("plist")
    
    init() {
        self.moodColor = nil
        self.description = ""
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        moodColor = try container.decode(Color.self, forKey: .moodColor).uiColor
        description = try container.decode(String.self, forKey: .description)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Color(uiColor: moodColor), forKey: .moodColor)
        try container.encode(description, forKey: .description)
    }

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
