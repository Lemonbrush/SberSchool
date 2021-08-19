//
//  main.swift
//  StringCalculator
//
//  Created by Alexander Rubtsov on 26.06.2021.
//

import Foundation

func sum(num1: String, num2: String) -> String {
    
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

print(sum(num1: "1126351526125351621621261", num2: "123212136263623127182182818218212121212") == "123212136263624253533708943569833742473")
print(sum(num1: "117374723923829427492472947275295385487584757457482032032490243584353485384204",
   num2: "123485438574385734579823759823749832478324789327498237489237498324982374892374237") == "123602813298309564007316232771025127863812374084955719521269988568566728377758441")
