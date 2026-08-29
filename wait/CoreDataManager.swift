//
//  CoreDataManager.swift
//  wait
//
//  Created by tee on 29.08.2026.
//

import Foundation
import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()
    var impulses = [Impulse]()
    
    private init() {
        fetchAllImpulses()
    }
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "wait")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchAllImpulses() {
        let req = Impulse.fetchRequest()
        
        if let impulses = try? persistentContainer.viewContext.fetch(req) {
            self.impulses = impulses
        }
    }
    
    func addNewImpulse(with title: String, at time: Date) {
        let impulse = Impulse(context: persistentContainer.viewContext)
        impulse.title = title
        impulse.time = time
        impulse.createdAt = Date.now
        impulse.id = UUID()
        
        saveContext()
        fetchAllImpulses()
    }
}
