//
//  DataCost.swift
//  Project SVOGA
//
//  Created by Roman Storozhenko on 1/1/19.
//  Copyright © 2019 Romych. All rights reserved.
//

import UIKit
import Foundation
import CoreData

final class DataCost {
    
     lazy var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveCostGas(amount: Float) {
        let gasEntity = NSEntityDescription.entity(forEntityName: "CostGas", in: context)!
        let gasRead = NSManagedObject(entity: gasEntity, insertInto: context)
        gasRead.setValue(amount, forKeyPath: "gas")
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }

    func getCostGas() -> Float {
        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "CostGas")
        let request = try! context.fetch(userFetch)
        var masive = Float()
        for data in request as! [NSManagedObject] {
            masive = (data.value(forKey: "gas") as! Float)
        }
        return masive
    }
    
    func saveCostWater(amount: Float) {
        let waterEntity = NSEntityDescription.entity(forEntityName: "CostWater", in: context)!
        let waterRead = NSManagedObject(entity: waterEntity, insertInto: context)
        waterRead.setValue(amount, forKeyPath: "water")
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func getCostWater() -> Float {
        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "CostWater")
        let request = try! context.fetch(userFetch)
        var result = Float()
        for data in request as! [NSManagedObject] {
            result = (data.value(forKey: "water") as! Float)
        }
        return result
    }
    
    func saveCostElectricity(amount: Float) {
        let electricityEntity = NSEntityDescription.entity(forEntityName: "CostElectricity", in: context)!
        let electricityRead = NSManagedObject(entity: electricityEntity, insertInto: context)
        electricityRead.setValue(amount, forKeyPath: "electricity")
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func getCostElectricity() -> Float {
        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "CostElectricity")
        let request = try! context.fetch(userFetch)
        var result = Float()
        for data in request as! [NSManagedObject] {
            result = (data.value(forKey: "electricity") as! Float)
        }
        return result
    }
}
