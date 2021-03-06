//
//  ViewController.swift
//  Project SVOGA
//
//  Created by ROMYCH on 01.12.18.
//  Copyright © 2018 Romych. All rights reserved.
//

import UIKit
import Charts
class ViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    @IBOutlet weak var allLabel: UILabel!
    
    @IBOutlet weak var pieView: PieChartView!
    
    let gasData = DataManagerGas()
    let cost = DataCost()
    let waterData = DataManagerWater()
    let electricityData = DataManagerElectricity()
    var gasDataChart = PieChartDataEntry(value: 0)
    var waterDataChart = PieChartDataEntry(value: 0)
    var electricityDataChart = PieChartDataEntry(value: 0)
    var masiveData = [PieChartDataEntry]()
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
        allLabel.text = String(setupPieChartInGRN()) + " " + "GRN"
        print("water",cost.getCostWater())
        appDelegate?.scheduleNotification()
    }
    
    override func viewDidLoad() {
    }
   
    func setupPieChartInGRN() -> Int {
        pieView.chartDescription?.text = "All Statistic"
        pieView.animate(xAxisDuration: 4, yAxisDuration: 4, easingOption: .easeInOutBack)
        gasDataChart.value = Double(calc(data: gasData.getGas())) * Double(cost.getCostGas())
        gasDataChart.label = "Gas"
        waterDataChart.value = Double(calc(data: waterData.getWater())) * Double(cost.getCostWater())
        waterDataChart.label = "Water"
        electricityDataChart.value = Double(calc(data: electricityData.getElectricity())) * Double(cost.getCostElectricity())
        electricityDataChart.label = "Electricity"
        
        let allMoney = Int(gasDataChart.value + waterDataChart.value + electricityDataChart.value)
        print(allMoney)
        masiveData = [gasDataChart, waterDataChart, electricityDataChart]
        let chartDataSet = PieChartDataSet(values: masiveData, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        let colors = [UIColor.init(red: 255 / 255, green: 94 / 255, blue: 0 / 255, alpha: 100),
                      UIColor.init(red: 0, green: 189 / 255, blue: 38 / 255, alpha: 100),
                      UIColor.blue]
        chartDataSet.colors = colors
        pieView.data = chartData
        return allMoney
    }
    
    func calc(data:[Float]) -> Float {
        var result: Float = 0
        if data.isEmpty == false {
            result = data.last! - data.first!
        } else {
            print("no data")
        }
        return result
    }
}

