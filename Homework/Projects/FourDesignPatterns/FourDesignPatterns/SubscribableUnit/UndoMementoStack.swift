//
//  UndoMementoStack.swift
//  FourDesignPatterns
//
//  Created by Alexander Rubtsov on 08.07.2021.
//

import Foundation

class UndoMementoStack {
    
    var delegate: MementoProtocol!
    
    init(_ delegate: MementoProtocol) {
        self.delegate = delegate
    }
    
    var snapshots = [String]()
    
    func saveSnapshot() {
        snapshots.append(delegate.message)
    }
    
    func undo() {
        guard snapshots.count > 0 else {
            delegate.message = ""
            return
            
        }
        
        snapshots.removeLast()
        delegate.message = snapshots.last ?? ""
    }
}
