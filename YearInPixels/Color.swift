//
//  Color.swift
//  YearInPixels
//
//  Created by Charity Hsu on 8/24/20.
//  Copyright © 2020 Charity Hsu. All rights reserved.
//

import Foundation
import UIKit

struct Color : Codable {
    var red : CGFloat = 0.0, green: CGFloat = 0.0, blue: CGFloat = 0.0, alpha: CGFloat = 0.0

    var uiColor : UIColor {
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }

    init(uiColor : UIColor) {
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    }
}
