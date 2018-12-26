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
    
    func getGas() -> [Float] {

        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "GasDataModel")
        //userFetch.fetchLimit = 5
        //userFetch.fetchBatchSize = 5
        userFetch.sortDescriptors = [NSSortDescriptor.init(key: "gas", ascending: true)]
      //  userFetch.sortDescriptors = [NSSortDescriptor.init(key: "date", ascending: true)]
        let request = try! context.fetch(userFetch)
        var masive = [Float]()
        //let gas: GasDataModel = request.last as! GasDataModel
        for data in request as! [NSManagedObject] {
            //print(data.value(forKey: "gas") as! Float)
            masive.append(data.value(forKey: "gas") as! Float)
        }
         let newMasive = masive.suffix(5)
        masive = Array(newMasive)
        return masive
    }
    
    func getDate() -> [String] {
        
        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "GasDataModel")
        //userFetch.fetchLimit = 5
        //userFetch.fetchBatchSize = 5
       // userFetch.sortDescriptors = [NSSortDescriptor.init(key: "gas", ascending: true)]
        userFetch.sortDescriptors = [NSSortDescriptor.init(key: "date", ascending: true)]
        let request = try! context.fetch(userFetch)
        var masive = [String]()
        //let gas: GasDataModel = request.last as! GasDataModel
        for data in request as! [NSManagedObject] {
            //print(data.value(forKey: "gas") as! Float)
            let someData = data.value(forKey: "date") as! Date
           //print( someData.shortString)
            masive.append(someData.shortString)
            
         //   masive.append(data.value(forKey: "date") as! String)
        }
        let newMasive = masive.suffix(5)
        masive = Array(newMasive)
        return masive
    }
    
    func saveGas(data: String, date: Date) {
        
        let gasEntity = NSEntityDescription.entity(forEntityName: "GasDataModel", in: context)!
        let gasRead = NSManagedObject(entity: gasEntity, insertInto: context)
        
        gasRead.setValue(Float(data), forKeyPath: "gas")
        gasRead.setValue(date, forKeyPath: "date")
        print("some =",gasRead)
        
        do {
            try context.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    func DeleteAllData(){
        
        
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
