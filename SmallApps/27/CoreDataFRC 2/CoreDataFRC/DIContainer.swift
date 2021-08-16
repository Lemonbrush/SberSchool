//
//  DIContainer.swift
//  CoreDataFRC
//
//  Created by Deniz Kaplan on 24.06.2021.
//

import Foundation

//Любой DI Container
// это просто ServiceLocator

final class Container {
	static let shared = Container()
	private init() {}

	lazy var coreDataStack = CoreDataStack(modelName: "CoreDataFRC")
}
