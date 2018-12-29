//
//  ElectricityStatisticVC.swift
//  Project SVOGA
//
//  Created by ROMYCH on 01.12.18.
//  Copyright © 2018 Romych. All rights reserved.
//

import UIKit

class ElectricityStatisticVC: UIViewController {
    let electricitys = DataManagerElectricity()
    
    @IBOutlet weak var enteredNumbers: UITextField!
    
    @IBOutlet weak var resultText: UITextField!
    
    @IBAction func buttonPressed() {
        
        if let enteredText = enteredNumbers.text, let enterNum = Float(enteredText) {
            let electricity = DataElectricity(electricityReadings: enterNum, costElectricityForKWH: 1.2)
            resultText.text = String(electricity.resultForReading)
            self.electricitys.saveElectricity(data: resultText.text!, date: Date.init())
        } else {
            resultText.text = "Enter valid data!"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enteredNumbers.keyboardType = UIKeyboardType.decimalPad
    }   
}
