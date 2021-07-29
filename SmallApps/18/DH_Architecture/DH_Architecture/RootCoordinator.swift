//
//  RootCoordinator.swift
//  NetworkTestApp
//
//  Created by Leonid Serebryanyy on 02.06.2021.
//

import Foundation
import UIKit

/// Координаторы управляют модулями (логическими частями приложения).
/// У каждого модуля есть входные и выходные параметры
class RootCoordinator {
	
//	typealias Dependencies = AppServiceLocatorDependencies // здесь мы описываем зависимости, которые нужны координатору и его дочерним модулям. У каждого координатора могут быть свои зависимости, и свой сервис локатор.
	
	let serviceLocator: ServiceLocator // хранит сервисы

	var router: RouterProtocol // отвечает за навигацию
	
	init(router: RouterProtocol, serviceLocator: ServiceLocator) {
		self.router = router
		self.serviceLocator = serviceLocator
	}
	
	// MARK: - Показываем модули из координаторов
    
    func showMVC() {
        let vc = SmallModuleViewController(out: processSmallModuleOut, deps: serviceLocator, somevalue: "hi")
        router.showVC(vc)
    }
    
    private func processSmallModuleOut(_ out: SmallModuleOutCommand) {
        switch out {
        case .exit:
            showMVVVM()
        case .nameChosen(let name):
            showMVP()
        }
    }
    
    func showMVVVM() {
        let viewModel = MVVMViewModel(deps: serviceLocator, out: <#Out#>)
        let vc = MMVMViewController(viewModel: viewModel)
        router.showVC(vc)
    }
    
    func showMVP() {
        let vc = MiddleModuleViewController(something: "hi", somethingElse: ["woow"], deps: serviceLocator, out: <#T##MiddleModuleOut##MiddleModuleOut##(MiddleModuleOutCommand) -> Void#>)
    }
    
}
