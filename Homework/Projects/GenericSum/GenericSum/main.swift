//
//  main.swift
//  GenericSum
//
//  Created by Alexander Rubtsov on 28.06.2021.
//

import Foundation

protocol Summable {
    static func +(lhs: Self, rhs: Self) -> Self
}

func sumTwoValues<T: Summable>(_ a: T, _ b: T) -> T {
    return a + b
}

extension String: Summable {}

//MARK: - Test
let c = "ABC"
let d = "DEF"

let resultString = sumTwoValues(c,d)
print(resultString)
