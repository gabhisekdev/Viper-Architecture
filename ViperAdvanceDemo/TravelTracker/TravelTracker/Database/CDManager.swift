//
//  CDManager.swift
//  CDPractice
//
//  Created by Abhisek on 26/12/17.
//  Copyright © 2017 Abhisek. All rights reserved.
//

import Foundation
import CoreData

class CDManager: NSObject {
    
    static let sharedDatabaseManager = CDManager()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TravelTracker")
        container.loadPersistentStores(completionHandler: { (persistentStoreDescription, error) in
            if error != nil {
              print("Encountered an error while loading persistent container - \(error?.localizedDescription)")
            } else {
                print(persistentStoreDescription)
            }
        })
        return container
    }()
    
    func saveContext() {
        if persistentContainer.viewContext.hasChanges {
            do {
                try persistentContainer.viewContext.save()
            } catch {
                print("Encountered an error while saving - \(error.localizedDescription)")
            }
        }
    }
    
}

