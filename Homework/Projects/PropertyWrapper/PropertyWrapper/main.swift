//
//  main.swift
//  PropertyWrapper
//
//  Created by Alexander Rubtsov on 22.06.2021.
//

import Foundation

@propertyWrapper struct COW<T:NSCopying> {
    var wrappedValue: T {
        didSet {
            wrappedValue = wrappedValue.copy() as! T
        }
    }
}

class Engine: NSCopying {
    enum EngineType {
        case Fast
        case Slow
    }
    
    var engineType: EngineType
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Engine(engineType: engineType)
    }
    
    init(engineType: EngineType) {
        self.engineType = engineType
    }
}

struct Car {
    @COW var engine: Engine
}

//MARK: - Test

var myEngine = Engine(engineType: .Fast)
var oldEngine = myEngine

var myCar = Car(engine: myEngine)

oldEngine.engineType = .Slow

print(myCar.engine.engineType)
