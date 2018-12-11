//
//  DateExtensions.swift
//  Project SVOGA
//
//  Created by ROMYCH on 04.12.18.
//  Copyright © 2018 Romych. All rights reserved.
//

import UIKit
import Foundation
extension Date {
    
    // return string from date in format "dd.MM.YYYY"
    var shortString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.YYYY"
        return dateFormatter.string(from: self)
    }
    
    // creates date var from string in format YYYY-MM-dd HH:mm:ss
    init(from string: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        self = dateFormatter.date(from: string) ?? Date()
    }
    
}
