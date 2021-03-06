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
    let cost = DataCost()
    let today = Date()
    
    override func viewWillAppear(_ animated: Bool) {
        labelCost.text = "Now= " + String(self.cost.getCostElectricity())
        if electricitys.getDate().last == today.shortString {
            chekData()
        }
    }
    
    override func viewDidLoad() {
        //labelCost.text = "Now= " + String(self.cost.getCostElectricity())

        super.viewDidLoad()
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
            if electricitys.getElectricity().isEmpty == true {
                let electricity = DataElectricity(electricityReadings: enterNum, costElectricityForKWH: cost.getCostElectricity())
                resultText.text = String(electricity.resultForReading)
                self.electricitys.saveElectricity(data: String(enterNum), amount: Float(0), date: Date.init())
                enteredNumbers.text = ""
                enteredNumbers.resignFirstResponder()
            } else {
                let electricity = DataElectricity(electricityReadings: enterNum, costElectricityForKWH: cost.getCostElectricity())
                resultText.text = String(electricity.resultForReading)
                self.electricitys.saveElectricity(data: String(enterNum), amount: Float(electricity.electricityReadings - electricitys.getElectricity().last!), date: Date.init())
                enteredNumbers.text = ""
                enteredNumbers.resignFirstResponder()
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
    
    
    @IBAction func deleteLast() {
        let alert = UIAlertController(title: "Attantion", message: "Delete last data?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.electricitys.deleteLastDataElectricity()
        }
        let canelActioin = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(okAction)
        alert.addAction(canelActioin)
        present(alert, animated: true)
        
    }
    
    @IBAction func calc(_ sender: UIButton) {
        self.cost.saveCostElectricity(amount: Float(enterCost.text!) ?? 1.2)
       // print(cost.saveCostElectricity(amount: Float (enterCost.text!) ?? 1.2))
        enterCost.text = ""
        enterCost.resignFirstResponder()
        labelCost.text = "Now= " + String(self.cost.getCostElectricity())
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
