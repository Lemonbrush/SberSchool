//
//  main.swift
//  GenericSum
//
//  Created by Alexander Rubtsov on 28.06.2021.
//

import Foundation

func sum<T: Numeric>(_ a: T, _ b: T) -> T {
    return a + b
}

//MARK: - Test

print(sum(5, 10))
