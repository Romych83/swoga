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
    
    let gas = DataManagerGas()
    let step = DataManagerConfig()
    
    override func viewWillAppear(_ animated: Bool) {
        setChartData(pokaz: gas.getGas(), date: gas.getDate())
        setChartData(pokaz: gas.getGasAmount(), date: gas.getDate())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setChartData(pokaz: [Float], date: [String]) {
        var yVals1 : [ChartDataEntry] = [ChartDataEntry]()
        lineChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values:date)
        if pokaz.count < step.getStep() {
            for i in 0 ..< pokaz.count {
                yVals1.append(ChartDataEntry(x: Double(i), y: Double(pokaz[i])))
            }
        } else {
            for i in pokaz.count - step.getStep() ..< pokaz.count {
                print(pokaz)
                yVals1.append(ChartDataEntry(x: Double(i), y: Double(pokaz[i])))
            }
        }
        
        let set1 = LineChartDataSet(values: yVals1, label: "Gas")
        set1.lineDashLengths = [5, 2.5]
        set1.highlightLineDashLengths = [5, 2.5]
        set1.setColor(.red)
        set1.setCircleColor(.green)
        set1.lineWidth = 1
        set1.circleRadius = 3
        set1.drawCircleHoleEnabled = false
        set1.valueFont = .systemFont(ofSize: 9)
        set1.formLineDashLengths = [5, 2.5]
        set1.formLineWidth = 1
        set1.formSize = 15
        let gradientColors = [ChartColorTemplates.colorFromString("#00ff0000").cgColor,
                              ChartColorTemplates.colorFromString("#ffff0000").cgColor]
        let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!
        set1.fillAlpha = 1
        set1.fill = Fill(linearGradient: gradient, angle: 90)
        set1.drawFilledEnabled = true
        var dataSets : [LineChartDataSet] = [LineChartDataSet]()
        dataSets.append(set1)
        let data: LineChartData = LineChartData(dataSets: dataSets)
        data.setValueTextColor(UIColor.white)
        self.lineChartView.data = data
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(gas.getGas())
        print(gas.getDate())
        
    }
}
