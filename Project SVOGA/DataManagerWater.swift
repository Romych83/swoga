//
//  DataManagerWater.swift
//  Project SVOGA
//
//  Created by Roman Storozhenko on 12/27/18.
//  Copyright © 2018 Romych. All rights reserved.
//

import Foundation
import UIKit
import CoreData

final class DataManagerWater {
    
    lazy var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func getWater() -> [Float] {
        
        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "WaterDataModel")
        //userFetch.fetchLimit = 5
        let request = try! context.fetch(userFetch)
        var masive = [Float]()
        for data in request as! [NSManagedObject] {
            masive.append(data.value(forKey: "water") as! Float)
        }
        return masive
    }
    
    func getWaterAmount() -> [Float] {
        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "WaterDataModel")
        let request = try! context.fetch(userFetch)
        var masive = [Float]()
        for data in request as! [NSManagedObject] {
            masive.append(data.value(forKey: "waterAmount") as! Float)
        }
        let newMasive = masive
        masive = Array(newMasive)
        return masive
    }
    
    func getDate() -> [String] {
        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "WaterDataModel")
        //userFetch.fetchLimit = 5
        let request = try! context.fetch(userFetch)
        var masive = [String]()
        for data in request as! [NSManagedObject] {
            let someData = data.value(forKey: "date") as! Date
            masive.append(someData.shortString)
        }
        
        let newMasive = masive
        masive = Array(newMasive)
        return masive
    }
    
    func saveWater(data: String, amount: Float, date: Date) {
        let waterEntity = NSEntityDescription.entity(forEntityName: "WaterDataModel", in: context)!
        let waterRead = NSManagedObject(entity: waterEntity, insertInto: context)
        waterRead.setValue(Float(data), forKeyPath: "water")
        waterRead.setValue(date, forKeyPath: "date")
        waterRead.setValue(amount, forKey: "waterAmount")
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    func DeleteAllDataWater() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: NSFetchRequest<NSFetchRequestResult>(entityName: "WaterDataModel"))
        do {
            try managedContext.execute(DelAllReqVar)
        }
        catch {
            print(error)
        }
    }
    
}
