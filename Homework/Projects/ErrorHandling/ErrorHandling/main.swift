//
//  main.swift
//  ErrorHandling
//
//  Created by Alexander Rubtsov on 03.07.2021.
//

import Foundation

enum TaskError: Error {
    case wrongAnswer(properAnswer: Double)
    case badTask
}

// MARK: - Main functions

func checkHomeWork(_ tasks: [String]) -> String {
    guard tasks.count > 0 else { return "нет примеров" }
    
    var errors = [String]()
    var rightAnswers = [String]()
    
    for task in tasks {
        
        do {
            rightAnswers.append(try checkTask(task))
            
        } catch {
            if let safeError = error as? TaskError {
                
                switch safeError {
                case .badTask:
                    return "переделывай"
                case .wrongAnswer(properAnswer: _):
                    errors.append(task)
                }
                
            }
        }
        
    }
    
    
    
    return "result"
}

func checkTask(_ str: String) throws -> String {
    let separatedTask = str.split(separator: " ")
    
    // Check task format
    if separatedTask.count != 5{
        throw TaskError.badTask
    }
    
    do {
        let result = try calculate(leftNum: String(separatedTask[0]),
                      rightNum: String(separatedTask[2]),
                      operation: String(separatedTask[1]))
        let expectedResult = try convertStringToDouble(String(separatedTask[4]))
        
        if result == expectedResult {
            return "молодец"
        } else {
            throw TaskError.wrongAnswer(properAnswer: result)
        }
    }
}

// MARK: - Helper functions

func convertStringToDouble(_ value: String) throws -> Double {
    guard let doubleValue = Double(value) else {
        throw TaskError.badTask
    }
    
    return doubleValue
}

func calculate(leftNum: String, rightNum: String, operation: String) throws -> Double {
    var result: Double
    
    switch operation {
    case "+": do {
        try result = convertStringToDouble(leftNum) + convertStringToDouble(rightNum)
    }
    case "-": do {
        try result = convertStringToDouble(leftNum) - convertStringToDouble(rightNum)
    }
    default:
        throw TaskError.badTask
    }
    
    return result
}

// MARK: - Test

let tasks = ["1 + 2 = 5", "4 + 6 = 0"]

print(checkHomeWork(tasks))

