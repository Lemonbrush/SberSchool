//
//  main.swift
//  Queue-FIFO
//
//  Created by Alexander Rubtsov on 29.06.2021.
//

import Foundation

// MARK: - Protocol

protocol Container {
    associatedtype Item
    
    var items: [Item] { get set }
    var count: Int { get }
    
    mutating func append(_ element:Item)
    mutating func remove(at index: Int)
}

extension Container {
    var count: Int {
        return items.count
    }
}

// MARK: - Queue FIFO

struct QueueFIFO<T>: Container {
    typealias Item = T
    
    var items: [Item]
    
    mutating func append(_ element: T) {
        items.append(element)
    }
    
    mutating func remove(at index: Int) {
        items.remove(at: index)
    }
}

// MARK: - Linked list

class Node<T>: Container {
    typealias Item = T
    
    var items: [T]
    
    var nextNode: Node? = nil
    var head: Node? = nil
    
    init(with items: [T]) {
        self.items = items
        head = self
    }
    
    func addNode(_ node: Node) {
        node.head = head
        nextNode = node
    }
    
    func printList() {
        var iterator = head
        
        while iterator != nil {
            if let safeIterator = iterator {
                print(safeIterator.items)
            }
            
            iterator = iterator?.nextNode
        }
    }
    
    func append(_ element: T) {
        items.append(element)
    }
    
    func remove(at index: Int) {
        items.remove(at: index)
    }
}

// MARK: - Test (Queue FIFO)

var stack = QueueFIFO(items: [1, 2, 3, 4, 5])
stack.append(999)
stack.remove(at: 1)
print("The array \(stack.items) has \(stack.count) elements")

// MARK: - Test (Linked list)

let node1 = Node<String>(with: ["One","Two","Three"])
let node2 = Node<String>(with: ["Four","Five","Six"])
let node3 = Node<String>(with: ["Seven","Eight","Nine"])
let node4 = Node<String>(with: ["Ten","Eleven","Twelve"])

node1.addNode(node2)
node2.addNode(node3)
node3.addNode(node4)

node2.printList()
