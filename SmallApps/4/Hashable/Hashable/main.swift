//
//  main.swift
//  Hashable
//
//  Created by Alexander Rubtsov on 23.06.2021.
//

import Foundation

class Relation: Hashable {
    static func == (lhs: Relation, rhs: Relation) -> Bool { lhs === rhs }
    
    func hash(into hasher: inout Hasher) {
        
        //hasher.combine(self) <-- It will make infinite recursion
        
        //We can make hash value from the self address
        withUnsafePointer(to: self) {
            hasher.combine($0)
        }
    }
}

struct Student: Hashable {
    let name: String
    let relation: Relation
}

//MARK: - Test

let relation = Relation()
let student = Student(name: "Bob", relation: relation)

var set = Set<Student>()
set.insert(student)

