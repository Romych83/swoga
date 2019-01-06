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
    let cost = DataCost()
    let today = Date()
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        labelCost.text = "Now= " + String(self.cost.getCostGas())
        if gass.getDate().last == today.shortString {
            chekData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // labelCost.text = "Now= " + String(self.cost.getCostGas())
        
        enteredNumbers.keyboardType = UIKeyboardType.decimalPad
        enterCost.keyboardType = UIKeyboardType.decimalPad
        self.hideKeyboardWhenTappedAround()
        
    }
    
    @IBOutlet weak var enteredNumbers: UITextField!
    @IBOutlet weak var resultText: UITextField!
    @IBOutlet weak var labelCost: UILabel!
    @IBOutlet weak var enterCost: UITextField!
    
    @IBAction func buttonPressed() {
        if let enteredText = enteredNumbers.text, let enterNum = Float(enteredText) {
            if gass.getGas().isEmpty == true {
                let gas = DataGas(gasReadings: enterNum, costGasForOneM3: cost.getCostGas())
                resultText.text = String(gas.resultForReading)
                self.gass.saveGas(data: String(enterNum), amount: Float(0), date: Date.init())
                enteredNumbers.text = ""
                enteredNumbers.resignFirstResponder()
            } else {
                let gas = DataGas(gasReadings: enterNum , costGasForOneM3: cost.getCostGas())
                resultText.text = String(gas.resultForReading)
                self.gass.saveGas(data: String(enterNum), amount: Float(gas.gasReadings - gass.getGas().last!), date: Date.init())
                enteredNumbers.text = ""
                enteredNumbers.resignFirstResponder()
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
    
    @IBAction func deleteLast() {
        let alert = UIAlertController(title: "Attantion", message: "Delete last data?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.gass.deleteLastDataGas()
        }
        let canelActioin = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(okAction)
        alert.addAction(canelActioin)
        present(alert, animated: true)
    }
    
    @IBAction func calc(_ sender: UIButton) {
        self.cost.saveCostGas(amount: (Float(enterCost.text!) ?? 8.5))
        print(cost.saveCostGas(amount: Float (enterCost.text!) ?? 8.5))
        enterCost.text = ""
        enterCost.resignFirstResponder()
        labelCost.text = "Now= " + String(self.cost.getCostGas())
    }
    
    func chekData () {
        let alert = UIAlertController(title: "Attantion", message: "Today Data allready exist", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Go back", style: .default) { (act) in
            self.navigationController?.popViewController(animated: true)
        }
        let canelActioin = UIAlertAction(title: "Continue", style: .cancel, handler: nil)
        alert.addAction(canelActioin)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

