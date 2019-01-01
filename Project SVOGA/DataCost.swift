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
        let gasEntity = NSEntityDescription.entity(forEntityName: "Cost", in: context)!
        let gasRead = NSManagedObject(entity: gasEntity, insertInto: context)
        gasRead.setValue(amount, forKeyPath: "gas")
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func getCostGas() -> Float {
        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Cost")
        let request = try! context.fetch(userFetch)
        var masive = Float()
        for data in request as! [NSManagedObject] {
            masive = (data.value(forKey: "gas") as! Float)
        }

        return masive
    }
}
