//
//  Services.swift
//  DH_Architecture
//
//  Created by Leonid Serebryanyy on 19.07.2021.
//

import Foundation

protocol HasNetworkService {
	var networkService: NetworkService { get }
}

protocol NetworkService {
    func loadData(_ completion: (SomeModel) -> Void)
}

class NetworkServiceImpl: NetworkService {
    init(storageLocator: StorageLocator) {
        
    }
    
    func loadData(_ completion: (SomeModel) -> Void) {
        let model = SomeModel(letters: ["h", "e", "l", "l", "o"])
        completion(model)
    }
    
    class NetworkServiceDTO: Codable {
        
    }
}

class NetworkSeviceMock: NetworkService {
    func loadData(_ completion: (SomeModel) -> Void) {
//        completion("mock")
    }
}

protocol StorageLocator { }
class StorageLocatorImpl: StorageLocator {}
