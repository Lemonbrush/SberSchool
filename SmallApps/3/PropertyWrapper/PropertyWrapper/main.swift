//
//  main.swift
//  PropertyWrapper
//
//  Created by Alexander Rubtsov on 21.06.2021.
//

import Foundation

@propertyWrapper
struct StringConcatination {
    var  wrappedValue: String {
        didSet {
            wrappedValue = oldValue + " " + wrappedValue
        }
    }
}

struct Person {
    @StringConcatination var name = "Alex"
}

var person = Person()
person.name = "Madson"

print(person.name)

