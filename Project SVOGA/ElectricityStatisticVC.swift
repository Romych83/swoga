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
            if electricitys.getElectricity().isEmpty == true {
                let electricity = DataElectricity(electricityReadings: enterNum, costElectricityForKWH: 1.2)
                resultText.text = String(electricity.resultForReading)
                self.electricitys.saveElectricity(data: resultText.text!, amount: Float(0), date: Date.init())
            } else {
                let electricity = DataElectricity(electricityReadings: enterNum, costElectricityForKWH: 1.2)
                resultText.text = String(electricity.resultForReading)
                self.electricitys.saveElectricity(data: resultText.text!, amount: Float(electricity.resultForReading - electricitys.getElectricity().last!), date: Date.init())
            }
            
        } else {
            resultText.text = "Enter valid data!"
        }
    }
    
    @IBAction func deleteData(_ sender: UIButton) {
        let alert = UIAlertController(title: "Attantion", message: "Delete all data?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.electricitys.DeleteAllDataElectricity()
        }
        let canelActioin = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(okAction)
        alert.addAction(canelActioin)
        present(alert, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        enteredNumbers.keyboardType = UIKeyboardType.decimalPad
    }   
}
