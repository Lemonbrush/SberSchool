//
//  MVVMViewModel.swift
//  DH_Architecture
//
//  Created by Леонид Серебряный on 26.07.2021.
//

import Foundation

class MVVMViewModel {
    private var deps: ServiceLocator
    
    var updated: (() -> Void)?
    
    init(deps: ServiceLocator) {
        self.deps = deps
    }
    
    public var name: String = ""
    
    func fetchData() {
        deps.networkService.loadData({ model in
            self.name = model.letters.reduce(into: "", { res, letter in
                res += letter
            })
            updated?()
        })
        
        
    }
    
}
