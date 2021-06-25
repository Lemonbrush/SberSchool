//
//  main.swift
//  StringCalculator
//
//  Created by Alexander Rubtsov on 26.06.2021.
//

import Foundation

func sum(num1: String, num2: String) -> String {
    if let safeNum1 = Int(num1), let safeNum2 = Int(num2) {
        return String(safeNum1 + safeNum2)
    } else {
        return "Invalid input :("
    }
}

//MARK: - Test

print(sum(num1: "5", num2: "10"))

print(sum(num1: "8", num2: "Ф"))

print(sum(num1: "-8", num2: "7"))


