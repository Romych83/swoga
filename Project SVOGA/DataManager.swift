//
//  DataManager.swift
//  Project SVOGA
//
//  Created by ROMYCH on 04.12.18.
//  Copyright © 2018 Romych. All rights reserved.
//
//
//import UIKit
//import Foundation
//import CoreData 
//
//
//// MARK: - Protocol
//
//protocol DataManagerProtocol {
//    func saveGas(_ history: GasStatistics)
//    func getHistory() -> [GasStatistics]?
//    func deleteGas()
//}
//
//final class DataManager: DataManagerProtocol {
//    
//    // MARK: - Private enums
//    
//    private enum DataStrings: String {
//        case GasDataModel
//        
//    }
//    
//    // MARK: - Lazy properties
//    
//    lazy var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//    
//    // MARK: - Open functions
//    
//    // gas
//    func saveGas(_ gas: GasStatistics) {
//        
//        let gasModel = GasDataModel(context: context)
//        gasModel.date = gas.date
//        gasModel.gas = gas.gas
//        
//        do {
//            try context.save()
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//    
//}
//
//func getGas() -> [GasStatistics]? {
//    let request = NSFetchRequest<HistoryDataModel>(entityName: DataStrings.GasDataModel.rawValue)
//    var gasData = [GasStatistics]()
//    do {
//        let gasHistory = try context.fetch(request)
//        gasHistory.forEach { (gas) in
//            guard let gas = Gas(from: gas) else { return }
//            gasData.append(gas)
//        }
//        return gasData
//    } catch {
//        print(error.localizedDescription)
//        return nil
//    }
//}
//
//func deleteGas() {
//    let request = NSFetchRequest<NSFetchRequestResult>(entityName: DataStrings.GasDataModel.rawValue)
//    let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
//    do {
//        try context.execute(deleteRequest)
//    } catch {
//        print(error.localizedDescription)
//    }
//}
//
