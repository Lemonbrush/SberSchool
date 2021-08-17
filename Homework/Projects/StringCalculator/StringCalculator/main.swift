//
//  main.swift
//  StringCalculator
//
//  Created by Alexander Rubtsov on 26.06.2021.
//

import Foundation

func sum(num1: String, num2: String) -> String {
    
    guard num1.isInt, num2.isInt else {
        return "Invalid input :("
    }
    
    var firstValue = String(num1.reversed())
    var secondValue = String(num2.reversed())
    var separator = false
    var result = ""
    
    if firstValue.count < secondValue.count {
        swap(&firstValue, &secondValue)
    }
    
    for (i, _) in firstValue.enumerated() {
        let currentNum = firstValue.index(firstValue.startIndex, offsetBy: i)
        var sum = (firstValue[currentNum].wholeNumberValue ?? 0)
        
        if secondValue.indices.contains(currentNum) {
            sum += (secondValue[currentNum].wholeNumberValue ?? 0)
        }
        
        if separator {
            sum += 1
        }
        
        separator = sum > 9
        
        result.append(String(sum % 10))
    }
    
    if separator {
        result.append("1")
    }
    
    return String(result.reversed())
}

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}

//MARK: - Test

print(sum(num1: "5", num2: "10"))

print(sum(num1: "8", num2: "Ф"))

print(sum(num1: String(Int.max), num2: String(Int.max)))
