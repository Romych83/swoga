//
//  ElectricityStatisticVC.swift
//  Project SVOGA
//
//  Created by ROMYCH on 01.12.18.
//  Copyright © 2018 Romych. All rights reserved.
//

import UIKit

class ElectricityStatisticVC: UIViewController {
    
    @IBOutlet weak var enteredNumbers: UITextField!
    
    @IBOutlet weak var resultText: UITextField!
    
    @IBAction func buttonPressed() {
        var electricitys = Float()
        if let enteredText = enteredNumbers.text, let enterNum = Float(enteredText) {
            electricitys = Float(enterNum)
            let electricity = DataElectricity(electricityReadings: electricitys, costElectricityForKWH: 1.2)
            let electricityForDay = ElectricityStatistic(electricity: electricity.resultForReading, date: .init())
            print(electricityForDay)
            resultText.text = String(electricity.resultForReading)
        } else {
            resultText.text = "Enter valid data!"
        }
    }
}
