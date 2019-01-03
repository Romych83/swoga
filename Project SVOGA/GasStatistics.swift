//
//  AllStatistics.swift
//  Project SVOGA
//
//  Created by ROMYCH on 04.12.18.
//  Copyright © 2018 Romych. All rights reserved.
//

import UIKit

struct GasStatistics {
    let gas: Float
    let date: Date
}
extension GasStatistics {
    init?(gasDataModel: GasDataModel) {
        guard let date = gasDataModel.date else { return nil}
        self.gas = gasDataModel.gas
        self.date = date
    }
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
