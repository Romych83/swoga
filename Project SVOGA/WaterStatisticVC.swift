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
            
            let water = DataWater(waterReadings: enterNum, costWaterForOneM3: 8.5)
            resultText.text = String(water.resultForReading)
            self.waters.saveWater(data: resultText.text!, date: Date.init())
        } else {
            resultText.text = "Enter valid data!"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


