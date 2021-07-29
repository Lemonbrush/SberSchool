//
//  ServiceLocator.swift
//  DH_Architecture
//
//  Created by Leonid Serebryanyy on 19.07.2021.
//

import Foundation

protocol ServiceLocator: HasNetworkService {
	
	var networkService: NetworkService {get}
	
	var storageLocator: StorageLocator {get}
}

class ServiceLocatorImpl: ServiceLocator {
	
    lazy var networkService: NetworkService = NetworkServiceImpl(storageLocator: storageLocator)
	
	lazy var storageLocator: StorageLocator = StorageLocatorImpl()
	
}

