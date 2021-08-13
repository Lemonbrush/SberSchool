//
//  NewStack.swift
//  CoreDataOld
//
//  Created by Deniz Kaplan on 20.06.2021.
//

import Foundation
import CoreData

final class NewStack {

	static let shared = NewStack()

	let conainer: NSPersistentContainer = {
		let container = NSPersistentContainer(name: "CoreDataOld")
		container.loadPersistentStores { desc, error in
			if let error = error {
				fatalError(error.localizedDescription)
			}
		}
		return container
	}()

	private init() {}
}
