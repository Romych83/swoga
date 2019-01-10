//
//  DataManagerConfig.swift
//  Project SVOGA
//
//  Created by Roman Storozhenko on 12/29/18.
//  Copyright © 2018 Romych. All rights reserved.
//

import UIKit
import CoreData
import Foundation
final class DataManagerConfig {
    
    lazy var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func getStep() -> Int {
        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "ConfigDataModel")
        let request = try! context.fetch(userFetch)
        var result = Int()
        for data in request as! [NSManagedObject] {
            result = data.value(forKey: "stepXChart") as! Int
        }
        return result
    }
    
    func saveStep(data: Int) {
        let stepEntity = NSEntityDescription.entity(forEntityName: "ConfigDataModel", in: context)!
        let stepRead = NSManagedObject(entity: stepEntity, insertInto: context)
        stepRead.setValue(Int(data), forKeyPath: "stepXChart")
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
