//
//  ConfigVC.swift
//  Project SVOGA
//
//  Created by ROMYCH on 01.12.18.
//  Copyright © 2018 Romych. All rights reserved.
//

import UIKit

class ConfigVC: UIViewController {
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    let confStep = DataManagerConfig()
    var step = 0
    let notifyDate = DataNotify()
    
    @IBOutlet weak var stepLabel: UILabel!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var notificationSwitch: UISwitch!
    
    override func viewWillAppear(_ animated: Bool) {
       //toggleNotification()
        //datePicker.isHidden = notifyDate.getNotifySwitch()
        print("dfsdf", notifyDate.getNotifyDate())
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "H:mm"
      notificationSwitch.isOn = notifyDate.getNotifySwitch()
        print(notifyDate.getNotifySwitch())
        datePicker.date = dateFormater.date(from: notifyDate.getNotifyDate()) ?? Date.init()
        appDelegate?.scheduleNotification()
        stepLabel.text = String(confStep.getStep())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "H:mm"
        print(step)
        print(confStep.getStep())
        
        
    }
   
    @IBAction func stepper(_ sender: UIStepper) {
        var step = Int()
        step = Int(sender.value)
        self.step = step
       confStep.saveStep(data: step)
       print("ew", step)
        stepLabel.text = String(step)
        stepLabel.resignFirstResponder()
    }

    func toggleNotification()  {
        if notificationSwitch.isOn {
            datePicker.isHidden = false
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "H:mm"
           let todayStr = dateFormater.string(from:datePicker.date)
            print(todayStr)
            notifyDate.saveNotifyData(data: todayStr, switchPos: false)
        } else {
            notificationSwitch.isOn = false
            datePicker.isHidden = true
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "H:mm"
            let todayStr = dateFormater.string(from:datePicker.date)
            print("no data")
            notifyDate.saveNotifyData(data: todayStr, switchPos: false)
            print(notifyDate.getNotifySwitch())
        }
    }
    
    @IBAction func toggleSwitch(_ sender: UISwitch) {
        toggleNotification()
    }
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        toggleNotification()
    }
}
