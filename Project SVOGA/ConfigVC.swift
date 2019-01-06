//
//  ConfigVC.swift
//  Project SVOGA
//
//  Created by ROMYCH on 01.12.18.
//  Copyright © 2018 Romych. All rights reserved.
//

import UIKit

class ConfigVC: UIViewController {
    let confStep = DataManagerConfig()
    var step = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(step)
    }
   
    @IBAction func stepper(_ sender: UIStepper) {
        var step = 5
        step = Int(sender.value)
        self.step = step
       confStep.saveStep(data: step)
    }
}
