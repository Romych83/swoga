//
//  DataElectricity.swift
//  Project SVOGA
//
//  Created by ROMYCH on 05.12.18.
//  Copyright © 2018 Romych. All rights reserved.
//

import UIKit

class DataElectricity: NSObject {
    var electricityReadings: Float
    var costElectricityForKWH: Float
    var resultForReading: Float {
        var result: Float
        result = electricityReadings * costElectricityForKWH
        return result
    }
    
    init(electricityReadings: Float ,costElectricityForKWH: Float) {
        self.electricityReadings = electricityReadings
        self.costElectricityForKWH = costElectricityForKWH
    }
}
