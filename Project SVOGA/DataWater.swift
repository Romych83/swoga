//
//  DataWater.swift
//  Project SVOGA
//
//  Created by ROMYCH on 05.12.18.
//  Copyright © 2018 Romych. All rights reserved.
//

import UIKit

class DataWater: NSObject {
    var waterReadings: Float
    var costWaterForOneM3: Float
    var resultForReading: Float {
        var result: Float
        result = waterReadings * costWaterForOneM3
        return result
    }
    
    init(waterReadings: Float ,costWaterForOneM3: Float) {
        self.waterReadings = waterReadings
        self.costWaterForOneM3 = costWaterForOneM3
    }
}
