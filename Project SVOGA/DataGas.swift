//
//  DataGas.swift
//  Project SVOGA
//
//  Created by ROMYCH on 03.12.18.
//  Copyright © 2018 Romych. All rights reserved.
//

import UIKit

class DataGas: NSObject {
    var gasReadings: Float
    var costGasForOneM3: Float
    var resultForReading: Float {
        var result: Float
        result = gasReadings * costGasForOneM3
        return result
    }
    
    init(gasReadings: Float ,costGasForOneM3: Float) {
        self.gasReadings = gasReadings
        self.costGasForOneM3 = costGasForOneM3
    }
}
