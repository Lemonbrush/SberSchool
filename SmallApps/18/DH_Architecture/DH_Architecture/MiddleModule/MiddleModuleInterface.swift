//
//  MiddleModuleInterface.swift
//  DH_Architecture
//
//  Created by Leonid Serebryanyy on 19.07.2021.
//

import Foundation

protocol MiddleModuleIn {
	
}

enum MiddleModuleOutCommand {
	case nameChosen(String)
	case exit
}

typealias MiddleModuleOut = (MiddleModuleOutCommand) -> Void
