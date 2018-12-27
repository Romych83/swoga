//  DataManager.swift
//  Project SVOGA
//
//  Created by ROMYCH on 04.12.18.
//  Copyright © 2018 Romych. All rights reserved.


import UIKit
import Foundation
import CoreData

final class DataManagerGas {
    
    lazy var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func getGas() -> [Float] {
        
        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "GasDataModel")
        //userFetch.fetchLimit = 5
        let request = try! context.fetch(userFetch)
        var masive = [Float]()
        for data in request as! [NSManagedObject] {
            masive.append(data.value(forKey: "gas") as! Float)
        }
        let newMasive = masive
        masive = Array(newMasive)
        return masive
    }
    
    func getDate() -> [String] {
        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "GasDataModel")
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
    
    func saveGas(data: String, date: Date) {
        let gasEntity = NSEntityDescription.entity(forEntityName: "GasDataModel", in: context)!
        let gasRead = NSManagedObject(entity: gasEntity, insertInto: context)
        gasRead.setValue(Float(data), forKeyPath: "gas")
        gasRead.setValue(date, forKeyPath: "date")
       
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    func DeleteAllDataGas() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: NSFetchRequest<NSFetchRequestResult>(entityName: "GasDataModel"))
        do {
            try managedContext.execute(DelAllReqVar)
        }
        catch {
            print(error)
        }
    }
    
}
