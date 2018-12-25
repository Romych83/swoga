//
//  GasStatisticVC.swift
//  Project SVOGA
//
//  Created by ROMYCH on 01.12.18.
//  Copyright © 2018 Romych. All rights reserved.
//

import UIKit

class GasStatisticVC: UIViewController {
    let gass = DataManager()
    
    @IBOutlet weak var enteredNumbers: UITextField!
    
    @IBOutlet weak var resultText: UITextField!
    
    @IBAction func buttonPressed() {
        
        if let enteredText = enteredNumbers.text, let enterNum = Float(enteredText) {
            
            let gas = DataGas(gasReadings: enterNum, costGasForOneM3: 8.5)
            //let gasForDay = GasStatistics(gas: gas.resultForReading, date: .init())
            //print(gasForDay)
            //print(gasForDay)
            resultText.text = String(gas.resultForReading)
           self.gass.saveGas(data: resultText.text!, date: Date.init())
            
        } else {
            resultText.text = "Enter valid data!"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//print(gass.context)
    }
}

