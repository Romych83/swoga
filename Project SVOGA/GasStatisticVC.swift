//
//  GasStatisticVC.swift
//  Project SVOGA
//
//  Created by ROMYCH on 01.12.18.
//  Copyright © 2018 Romych. All rights reserved.
//

import UIKit

class GasStatisticVC: UIViewController {
    
    @IBOutlet weak var enteredNumbers: UITextField!
    
    @IBOutlet weak var resultText: UITextField!
    
    @IBAction func buttonPressed() {
        var gass = Float()
        if let enteredText = enteredNumbers.text, let enterNum = Float(enteredText) {
            gass = Float(enterNum)
            let gas = DataGas(gasReadings: gass, costGasForOneM3: 8.5)
            let gasForDay = GasStatistics(gas: gas.resultForReading, date: .init())
            print(gasForDay)
            resultText.text = String(gas.resultForReading)
        } else {
            resultText.text = "Enter valid data!"
        }
    }
}

