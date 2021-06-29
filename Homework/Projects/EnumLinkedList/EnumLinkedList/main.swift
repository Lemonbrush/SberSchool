//
//  main.swift
//  EnumLinkedList
//
//  Created by Alexander Rubtsov on 29.06.2021.
//

import Foundation

indirect enum LinkedList<T> {
    case Nil
    case Data(value: T, nextNode: LinkedList<T>)
    
    init() {
        self = .Nil
    }
    init(_ val: T) {
        self = .Data(value: val, nextNode: .Nil)
    }
    
    mutating func addNode(nodeWithValue value: T) {
        self = .Data(value: value, nextNode: self)
    }
    
    static func printList(byNode node: LinkedList) {
        switch node {
        case .Nil:
            break
        case .Data(let value, let nextNode):
            print(value)
            LinkedList.printList(byNode: nextNode)
        }
    }
    
    func printLast() {
        switch self {
        case .Nil:
            break
        case .Data(let value, _):
            print(value)
        }
    }
}

// MARK: - Test

var list = LinkedList<Int>()

for num in stride(from: 0, to: 10, by: 1) {
    list.addNode(nodeWithValue: num)
}

LinkedList.printList(byNode: list)
