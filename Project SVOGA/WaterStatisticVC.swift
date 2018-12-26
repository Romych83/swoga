//
//  WaterStatisticVC.swift
//  Project SVOGA
//
//  Created by ROMYCH on 01.12.18.
//  Copyright © 2018 Romych. All rights reserved.
//

import UIKit

class WaterStatisticVC: UIViewController {
    
    @IBOutlet weak var enteredNumbers: UITextField!
    
    @IBOutlet weak var resultText: UITextField!
    
    @IBAction func buttonPressed() {
        var waters = Float()
        if let enteredText = enteredNumbers.text, let enterNum = Float(enteredText) {
            waters = Float(enterNum)
            let water = DataWater(waterReadings: waters, costWaterForOneM3: 15.78)
            let waterForDay = WaterStatistics(water: water.resultForReading, date: .init())
            print(waterForDay)
            resultText.text = String(water.resultForReading)
        reloadInputViews()
            
        } else {
            resultText.text = "Enter valid data!"
        }
    }
}


