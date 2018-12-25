//
//  GasVC.swift
//  Project SVOGA
//
//  Created by ROMYCH on 01.12.18.
//  Copyright © 2018 Romych. All rights reserved.
//

import UIKit
import Charts
class GasVC: UIViewController, ChartViewDelegate {
    
    @IBOutlet weak var lineChartView: LineChartView!
    
    
    
    let gas = DataManager()
    override func viewDidLoad() {
        super.viewDidLoad()
       
       setCgartData(pokaz: gas.getGas())
    }
    
    func setCgartData(pokaz: [Float]) {
        var yVals1 : [ChartDataEntry] = [ChartDataEntry]()
        for i in 0 ..< pokaz.count {
            yVals1.append(ChartDataEntry(x: Double(pokaz[i]), y: Double(i)))
        }
        
        let set1 = LineChartDataSet(values: yVals1, label: "some")
        let data = LineChartData(dataSet: set1)
        
        self.lineChartView.data = data
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        gas.getGas()
       // print(gas.getGas().gas)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
