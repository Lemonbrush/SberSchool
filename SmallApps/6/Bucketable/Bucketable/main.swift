//
//  main.swift
//  Bucketable
//
//  Created by Alexander Rubtsov on 28.06.2021.
//

import Foundation

protocol SimpleArray {
    associatedtype DataType: Comparable
    
    var items: [DataType] { get set }
    
    mutating func add(item: DataType)
    mutating func remove(item: DataType)
}

extension SimpleArray {
    mutating func add(item: DataType) {
        items.append(item)
    }
    
    mutating func remove(item: DataType) {
        for (i,elem) in items.enumerated() {
            if elem == item {
                items.remove(at: i)
            }
        }
    }
}

struct Bucket:SimpleArray {
    var items = [Int]() //DataType definition
}

//MARK: - Test

var example = Bucket(items: [1,2,3])

example.add(item: 9999)

print(example.items)
