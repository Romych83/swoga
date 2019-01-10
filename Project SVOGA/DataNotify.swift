//
//  DataNotify.swift
//  Project SVOGA
//
//  Created by Roman Storozhenko on 1/9/19.
//  Copyright © 2019 Romych. All rights reserved.
//

import Foundation
import UIKit
import CoreData

final class DataNotify {
    lazy var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveNotifyData(data: String, switchPos: Bool) {
        let notifyEntity = NSEntityDescription.entity(forEntityName: "NotifyDate", in: context)!
        let notifyRead = NSManagedObject(entity: notifyEntity, insertInto: context)
        notifyRead.setValue(data, forKeyPath: "date")
        notifyRead.setValue(switchPos, forKeyPath: "switchOn")
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func getNotifyDate() -> String {
        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "NotifyDate")
        let request = try! context.fetch(userFetch)
        var result = String()
        for data in request as! [NSManagedObject] {
            result = (data.value(forKey: "date") as! String)
        }
        return result
    }
    
    func getNotifySwitch() -> Bool {
        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "NotifyDate")
        let request = try! context.fetch(userFetch)
        var result = Bool()
        for data in request as! [NSManagedObject] {
            result = (data.value(forKeyPath: "switchOn") != nil)
        }
        return result
    }
    
}
