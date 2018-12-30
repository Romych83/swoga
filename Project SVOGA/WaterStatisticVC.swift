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
    
    @IBOutlet weak var enteredNumbers: UITextField!
    
    @IBOutlet weak var resultText: UITextField!
    
    @IBAction func buttonPressed() {
        
        if let enteredText = enteredNumbers.text, let enterNum = Float(enteredText) {
            if waters.getWater().isEmpty == true {
                let water = DataWater(waterReadings: enterNum, costWaterForOneM3: 8.5)
                resultText.text = String(water.resultForReading)
                self.waters.saveWater(data: resultText.text!, amount: Float(0), date: Date.init())
            } else {
                let water = DataWater(waterReadings: enterNum , costWaterForOneM3: 8.5)
                resultText.text = String(water.resultForReading)
                self.waters.saveWater(data: resultText.text!, amount: Float(water.resultForReading - waters.getWater().last!), date: Date.init())
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enteredNumbers.keyboardType = UIKeyboardType.decimalPad
    }
}


