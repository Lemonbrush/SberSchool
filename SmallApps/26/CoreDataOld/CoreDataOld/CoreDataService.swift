//
//  CoreDataService.swift
//  CoreDataOld
//
//  Created by Alexander Rubtsov on 13.08.2021.
//

import Foundation
import CoreData

final class CoreDataService {
    
    private let model: NSManagedObjectModel
    let mainContext: NSManagedObjectContext
    let backgroundContext: NSManagedObjectContext
    let coordinator: NSPersistentStoreCoordinator
    
    init() {
        
        //Берем путь до модели в Xcode
        guard let url = Bundle.main.url(forResource: "OldModel", withExtension: "momd"), let model = NSManagedObjectModel(contentsOf: url) else {
            preconditionFailure("Failed to load OldModel")
        }
        
        self.model = model
        
        // Указываем путь
        coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.model)
        
        let storagePath = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory,
                                                             .userDomainMask,
                                                             true).first ?? ""
        let storageUrl = URL(fileURLWithPath: storagePath).appendingPathComponent("OldModel.sqlite")
        
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storageUrl , options: nil)
        } catch {
            preconditionFailure("Failed to load coordinator")
        }
        
        // Связываем 2 контекста и координатор
        mainContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        backgroundContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        
        mainContext.persistentStoreCoordinator = self.coordinator
        
        backgroundContext.parent = mainContext
    }
}
