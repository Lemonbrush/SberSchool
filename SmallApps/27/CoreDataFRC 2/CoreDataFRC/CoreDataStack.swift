//
//  CoreDataStack.swift
//  CoreDataFRC
//
//  Created by Deniz Kaplan on 24.06.2021.
//

import Foundation
import CoreData

final class CoreDataStack {

	private let container: NSPersistentContainer

	init(modelName: String) {
		let container = NSPersistentContainer(name: modelName)
		self.container = container
	}


	func load() {
		container.loadPersistentStores { desc, error in
			if let error = error {
				assertionFailure(error.localizedDescription)
			}
		}
	}

	var viewContext: NSManagedObjectContext { container.viewContext }
	lazy var backgroundContext: NSManagedObjectContext = container.newBackgroundContext()

	var coordinator: NSPersistentStoreCoordinator { container.persistentStoreCoordinator }
}
