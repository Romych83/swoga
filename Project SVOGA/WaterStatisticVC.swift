//
//  WaterStatisticVC.swift
//  Project SVOGA
//
//  Created by ROMYCH on 01.12.18.
//  Copyright © 2018 Romych. All rights reserved.
//

import UIKit

class WaterStatisticVC: UIViewController {
    let waters = DataManagerWater()
    let cost = DataCost()
    
    override func viewWillAppear(_ animated: Bool) {
        labelCost.text = "Now= " + String(self.cost.getCostWater())
        print(cost.getCostWater())
    }
    
    override func viewDidLoad() {
       // labelCost.text = "Now= " + String(self.cost.getCostWater())
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
            if waters.getWater().isEmpty == true {
                let water = DataWater(waterReadings: enterNum, costWaterForOneM3: cost.getCostWater())
                resultText.text = String(water.resultForReading)
                self.waters.saveWater(data: String(enterNum), amount: Float(0), date: Date.init())
                enteredNumbers.text = ""
                enteredNumbers.resignFirstResponder()
            } else {
                let water = DataWater(waterReadings: enterNum , costWaterForOneM3: cost.getCostWater())
                resultText.text = String(water.resultForReading)
                self.waters.saveWater(data: String(enterNum), amount: Float(water.waterReadings - waters.getWater().last!), date: Date.init())
                enteredNumbers.text = ""
                enteredNumbers.resignFirstResponder()
            }
        } else {
            resultText.text = "Enter valid data!"
        }
    }
    
    @IBAction func deleteWater(_ sender: UIButton) {
        let alert = UIAlertController(title: "Attantion", message: "Delete all data?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.waters.DeleteAllDataWater()
        }
        let canelActioin = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(okAction)
        alert.addAction(canelActioin)
        present(alert, animated: true)    }
    
    @IBAction func calc(_ sender: UIButton) {
        self.cost.saveCostWater(amount: (Float(enterCost.text!) ?? 10.092))
        print(cost.saveCostWater(amount: Float (enterCost.text!) ?? 10.092))
        enterCost.text = ""
        enterCost.resignFirstResponder()
        labelCost.text = "Now= " + String(self.cost.getCostWater())
        
    }
}


