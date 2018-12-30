//
//  GasStatisticVC.swift
//  Project SVOGA
//
//  Created by ROMYCH on 01.12.18.
//  Copyright © 2018 Romych. All rights reserved.
//

import UIKit

class GasStatisticVC: UIViewController {
    let gass = DataManagerGas()
    
    @IBOutlet weak var enteredNumbers: UITextField!
    
    @IBOutlet weak var resultText: UITextField!
    
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    @IBAction func buttonPressed() {
        
        if let enteredText = enteredNumbers.text, let enterNum = Float(enteredText) {
            if gass.getGas().isEmpty == true {
                let gas = DataGas(gasReadings: enterNum, costGasForOneM3: 8.5)
                resultText.text = String(gas.resultForReading)
                self.gass.saveGas(data: resultText.text!, amount: Float(0), date: Date.init())
            } else {
                let gas = DataGas(gasReadings: enterNum , costGasForOneM3: 8.5)
                resultText.text = String(gas.resultForReading)
                self.gass.saveGas(data: resultText.text!, amount: Float(gas.resultForReading - gass.getGas().last!), date: Date.init())
            }
            
        } else {
            resultText.text = "Enter valid data!"
        }
    }
    
    @IBAction func deleteGas(_ sender: UIButton) {
        let alert = UIAlertController(title: "Attantion", message: "Delete all data?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.gass.DeleteAllDataGas()
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

