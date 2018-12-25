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
        
        let request = try! context.fetch(userFetch)
        var masive = [Float]()
        
        //let gas: GasDataModel = request.last as! GasDataModel
        for data in request as! [NSManagedObject] {
            //print(data.value(forKey: "gas") as! Float)
            masive.append(data.value(forKey: "gas") as! Float)
        }
         let newArray = masive.suffix(5)
        masive = Array(newArray)
        print(masive)
        return masive
    }
    
    func saveGas(data: String, date: Date) {
        
        let gasEntity = NSEntityDescription.entity(forEntityName: "GasDataModel", in: context)!
        let gasRead = NSManagedObject(entity: gasEntity, insertInto: context)
        
        gasRead.setValue(Float(data), forKeyPath: "gas")
        print("some =",gasRead)
        do {
            try context.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    func deleteAllData(_ entity:String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try context.viewContext.fetch(fetchRequest)
            for object in results {
                guard let objectData = object as? NSManagedObject else {continue}
                dataController.viewContext.delete(objectData)
            }
        } catch let error {
            print("Detele all data in \(entity) error :", error)
        }
    }
    
    
}
