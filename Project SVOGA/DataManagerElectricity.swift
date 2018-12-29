//
//  DataManagerElectricity.swift
//  Project SVOGA
//
//  Created by Roman Storozhenko on 12/27/18.
//  Copyright © 2018 Romych. All rights reserved.
//

import Foundation
import UIKit
import CoreData

final class DataManagerElectricity {
    
    lazy var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func getElectricity() -> [Float] {
        
        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "ElectricityDataModel")
        //userFetch.fetchLimit = 5
        let request = try! context.fetch(userFetch)
        var masive = [Float]()
        for data in request as! [NSManagedObject] {
            masive.append(data.value(forKey: "electricity") as! Float)
        }
        let newMasive = masive
        masive = Array(newMasive)
        return masive
    }
    
    func getDate() -> [String] {
        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "ElectricityDataModel")
        //userFetch.fetchLimit = 5
        let request = try! context.fetch(userFetch)
        var masive = [String]()
        for data in request as! [NSManagedObject] {
            let someData = data.value(forKey: "date") as! Date
            masive.append(someData.shortString)
        }
        return masive
    }
    
    func saveElectricity(data: String, date: Date) {
        let electricityEntity = NSEntityDescription.entity(forEntityName: "ElectricityDataModel", in: context)!
        let electricityRead = NSManagedObject(entity: electricityEntity, insertInto: context)
        electricityRead.setValue(Float(data), forKeyPath: "electricity")
        electricityRead.setValue(date, forKeyPath: "date")
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func DeleteAllDataElectricity() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: NSFetchRequest<NSFetchRequestResult>(entityName: "ElectricityDataModel"))
        do {
            try managedContext.execute(DelAllReqVar)
        }
        catch {
            print(error)
        }
    }
}
