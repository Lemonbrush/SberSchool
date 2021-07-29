//
//  MiddleModulePresenter.swift
//  DH_Architecture
//
//  Created by Leonid Serebryanyy on 19.07.2021.
//

import Foundation

class MiddleModulePresenter {
	private weak var view: MiddleModuleView?
	private let out: MiddleModuleOut
	private var deps: ServiceLocator
	
	init(
		view: MiddleModuleView,
		out: @escaping MiddleModuleOut,
		deps: ServiceLocator,
		something: String
	) {
		self.view = view
		self.out = out
		self.deps = deps
	}
    
    private var name: String = ""
	
	public func foo() {
        deps.networkService.loadData({ model in
            self.name = model.letters.reduce(into: "", { res, letter in
                res += letter
            })
            view?.updateName(name)
        })
	}
}
