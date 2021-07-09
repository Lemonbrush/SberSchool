//
//  DummyModeel.swift
//  MVC
//
//  Created by Alexander Rubtsov on 09.07.2021.
//

import Foundation

struct DummyModel {
    var dummyString = "Dummy string"
    
    mutating func updateDummyString(with newString: String) {
        dummyString = newString
    }
}
