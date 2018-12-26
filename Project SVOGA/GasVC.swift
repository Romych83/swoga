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
       //gas.DeleteAllData()
       setCgartData(pokaz: gas.getGas(), date: gas.getDate())
        lineChartView.reloadInputViews()
    }
    
    func setCgartData(pokaz: [Float], date: [String]) {
        var yVals1 : [ChartDataEntry] = [ChartDataEntry]()
        for i in 0 ..< pokaz.count {
            yVals1.append(ChartDataEntry(x: Double(i), y: Double(pokaz[i])))
//            lineChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: <#T##[String]#>)
        }
        
        let set1 = LineChartDataSet(values: yVals1, label: "some")
        let data = LineChartData(dataSet: set1)
        self.lineChartView.data = data
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     //   gas.getGas()
        print(gas.getGas())
        print(gas.getDate())
    }
    

}
