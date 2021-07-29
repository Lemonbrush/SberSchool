//
//  SmallModule.swift
//  DH_Architecture
//
//  Created by Leonid Serebryanyy on 19.07.2021.
//

import Foundation
import UIKit

class SmallModuleViewController: UIViewController, ViewSpecificController {
	typealias RootView = SmallModuleView
	
	override func loadView() {
		self.view = RootView()
	}
	
	private let out: SmallModuleOut
	private let networkService: NetworkService
	
	init(
		out: @escaping SmallModuleOut,
		deps: SmallModuleDeps,
		somevalue: String
	) {
		self.out = out
		self.networkService = deps.networkService
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		view().makeUI()
		// dataProvider.getStringsToShow {strings in ...}
	}
    
    override func viewDidAppear(_ animated: Bool) {
        view.changeColors
    }
}

