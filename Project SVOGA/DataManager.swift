//  DataManager.swift
//  Project SVOGA
//
//  Created by ROMYCH on 04.12.18.
//  Copyright © 2018 Romych. All rights reserved.


import UIKit
import Foundation
import CoreData

final class DataManager {
    
    lazy var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func getGas() -> GasStatistics {
        
        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "GasDataModel")
        userFetch.fetchLimit = 1
        userFetch.sortDescriptors = [NSSortDescriptor.init(key: "gas", ascending: true)]
        
        let request = try! context.fetch(userFetch)
        let gas: GasStatistics = request.first as! GasStatistics
        return gas
    }
    
    func saveGas(data: String) {
        
        let gasEntity = NSEntityDescription.entity(forEntityName: "GasDataModel", in: context)!
        let gasRead = NSManagedObject(entity: gasEntity, insertInto: context)
        
        gasRead.setValue(Float(data), forKeyPath: "gas")
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
}
