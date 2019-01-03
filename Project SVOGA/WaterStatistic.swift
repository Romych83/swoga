//
//  WaterStatistic.swift
//  Project SVOGA
//
//  Created by ROMYCH on 04.12.18.
//  Copyright © 2018 Romych. All rights reserved.
//

import UIKit

struct WaterStatistics {
    let water: Float
    let date: Date
}
extension WaterStatistics {
    init?(waterDataModel: WaterDataModel) {
        guard let date = waterDataModel.date else { return nil}
        self.water = waterDataModel.water
        self.date = date
    }
}

