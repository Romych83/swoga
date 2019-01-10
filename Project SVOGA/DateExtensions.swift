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
    var shortString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM"
        return dateFormatter.string(from: self)
    }
 
    init(from string: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        self = dateFormatter.date(from: string) ?? Date()
    }
}
