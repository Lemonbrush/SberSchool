//
//  main.swift
//  HigherOrderFunctions
//
//  Created by Alexander Rubtsov on 01.07.2021.
//

import Foundation

var collection = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

//MARK: - map() as filter()

print("Regular filter() result - \(collection.filter() { $0 > 5 })")

var result = [Int]()
_ = collection.map(){
        if $0 > 5 {
            result.append($0)
        }
}
print("Map() as filter() result - \(result) \n")

//MARK: - map() as reduce()

print("Regular reduce() result - \(collection.reduce(0) { $0 + $1 })")

var result2 = 0
collection.map() { result2 += $0 }
print("Map() as reduce() result - \(result2)")
