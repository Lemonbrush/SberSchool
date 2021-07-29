//
//  SmallModuleInterface.swift
//  DH_Architecture
//
//  Created by Leonid Serebryanyy on 19.07.2021.
//

import Foundation


// MARK: - In

protocol SmallModuleIn {
	
}


// MARK: - Out

enum SmallModuleOutCommand {
	case nameChosen(String)
	case exit
}

typealias SmallModuleOut = (SmallModuleOutCommand) -> Void


// MARK: - Dependencies

typealias SmallModuleDeps = HasNetworkService
