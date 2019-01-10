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
        let request = try! context.fetch(userFetch)
        var masive = [Float]()
        for data in request as! [NSManagedObject] {
            masive.append(data.value(forKey: "gas") as! Float)
        }
        let newMasive = masive
        masive = Array(newMasive)
        return masive
    }
    
    func getGasAmount() -> [Float] {
        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "GasDataModel")
        let request = try! context.fetch(userFetch)
        var masive = [Float]()
        for data in request as! [NSManagedObject] {
            masive.append(data.value(forKey: "gasAmount") as! Float)
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
        return masive
    }
    
    func saveGas(data: String, amount: Float, date: Date) {
        let gasEntity = NSEntityDescription.entity(forEntityName: "GasDataModel", in: context)!
        let gasRead = NSManagedObject(entity: gasEntity, insertInto: context)
        gasRead.setValue(Float(data), forKeyPath: "gas")
        gasRead.setValue(date, forKeyPath: "date")
        gasRead.setValue(amount, forKey: "gasAmount")
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
    
    func deleteLastDataGas() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let delLastRq = NSFetchRequest<NSFetchRequestResult>(entityName: "GasDataModel")
        if let result = try? context.fetch(delLastRq) {
            for _ in result {
                context.delete(result.last as! NSManagedObject)
            }
        }
        do {
            try managedContext.save()
        }
        catch {
            print(error)
        }
    }
}
