//
//  ElectricitiStatistic.swift
//  Project SVOGA
//
//  Created by ROMYCH on 04.12.18.
//  Copyright © 2018 Romych. All rights reserved.
//

import UIKit

struct ElectricityStatistics {
    let electricity: Float
    let date: Date
}
extension ElectricityStatistics {
    init?(electricityDataModel: ElectricityDataModel) {
        guard let date = electricityDataModel.date else { return nil}
        self.electricity = electricityDataModel.electricity
        self.date = date
    }
}
