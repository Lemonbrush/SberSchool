//
//  main.swift
//  MultiSet
//
//  Created by Alexander Rubtsov on 24.06.2021.
//

import Foundation

struct Multiset<T: Hashable> {
    var storage: [T : Int] = [:]
    
    var totalCount: Int = 0
    
    mutating func add(_ element: T) {
        storage[element, default: 0] += 1
        totalCount += 1
    }
    
    func count(for element: T) -> Int {
        return storage[element, default: 0]
    }
    
    mutating func remove(element: T) {
        if let count = storage[element] {
            if count > 1 {
                storage[element] = count - 1
            } else {
                storage[element] = nil
            }
            totalCount -= 1
        }
    }
    
    //Additional implementations
    
    init<A: Collection>(_ collection: A) where A.Element == T {
        for element in collection {
            self.add(element)
        }
    }
    
    subscript(key: T) -> Int {
        get {
            count(for: key)
        }
        set {
            storage[key] = newValue
        }
    }
    
    func printValues() {
        print("Multiset contains:")
        for element in storage.keys {
            print(element, " - ", storage[element]!)
        }
        print("\n")
    }
}

//MARK: - Test

var mySuperMultiSet = Multiset<Int>([1,2,3,4,1,1,1,1,1,4,4,4])
mySuperMultiSet.printValues()

//count(for element:)
let query = 1
print("There is/are \(mySuperMultiSet[query]) elements with key - \(query)")
print("There is/are \(mySuperMultiSet.count(for: query)) elements with key - \(query) (with the count function) \n")

//remove(element:)
mySuperMultiSet.remove(element: 2)
print("2 has been deleted")
mySuperMultiSet.printValues()

//totalCount
print("Total elements count - \(mySuperMultiSet.totalCount) \n")

//add(_ element:)
let newElement = 9
mySuperMultiSet.add(newElement)
print("\(newElement) has been added to the Multiset")
mySuperMultiSet.printValues()



