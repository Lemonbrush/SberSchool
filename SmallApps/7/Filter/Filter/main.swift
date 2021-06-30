//
//  main.swift
//  Filter
//
//  Created by Alexander Rubtsov on 30.06.2021.
//

import Foundation

var arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

print(arr.filter { $0 > 5})

// MARK: - myFilter

extension Array {
    func myFilter(filter: (Element) -> Bool) -> Array {
        var arr = Array()
        
        for elem in self {
            if filter(elem) {
                arr.append(elem)
            }
        }
        
        return arr
    }
}

print(arr.myFilter(filter: { x in
                    if x > 5 {
                        return true
                    } else {
                        return false
                    }
}))
