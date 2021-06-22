//
//  main.swift
//  COWWrapper
//
//  Created by Alexander Rubtsov on 21.06.2021.
// Реализовать COW reference type объекта в своей структуре

import Foundation

//Simple class
class Car {
    
    enum Model {
        case Porsche
        case lamborghini
        case Lada
    }
    
    var model: Model
    
    init(model: Model) {
        self.model = model
    }
}

//Struct that handles COW around the simple class object
struct CarCopyOnWrite {
    var car: Car
    
    var model: Car.Model {
        get { return car.model }
        set {
            if !isKnownUniquelyReferenced(&car) {
                car = Car(model: newValue)
            }
            car.model = newValue
        }
    }
    
    init(model: Car.Model) {
        car = Car(model: model)
    }
}

//MARK: - Test

var myCar = CarCopyOnWrite(model: .lamborghini)
var otherCar = myCar

otherCar.model = .Lada

print("My car is \(myCar.model) while other cars are just \(otherCar.model)")
