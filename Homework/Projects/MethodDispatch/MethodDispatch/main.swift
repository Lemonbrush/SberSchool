//
//  main.swift
//  MethodDispatch
//
//  Created by Alexander Rubtsov on 26.06.2021.
//

import Foundation

//MARK: - Message Dispatch
//Можно посылать любые сообщения объектам. Если объект не реализовал эту функцию, то компилятор может по волшебству с этим разобраться или даже создать имплементацию под вызов

@objcMembers class Person: NSObject {
    var name: String
    
    dynamic func talk() {
        print("\(name) is saying Blah-blah-blah")
    }
    
    dynamic func walk() {
        print("\(name) is walking")
    }
    
    init(name: String) {
        self.name = name
    }
}

@objcMembers class Pirate: Person {
    override dynamic func talk() {
        print("\(name) is saying Arrrrr...")
    }
    dynamic func rob() {
        print("\(name) is robbing")
    }
}

let pirate = Pirate(name: "BlackBeard")
pirate.rob()
pirate.perform(#selector(Person.talk)) // <-- message

//MARK: - Virtual Table
//Содержит копию таблицы родителя, что немного замедляет работу компилятора

class Animal {
    func voice() {}
}

class Dog: Animal {
    override func voice() {
        print("Bark")
    }
    func play() {}
}

//MARK: - Witness Table
//Каждый элемент содержит таблицу под каждый протокол

protocol Nurse {
    func heal()
    func talk()
}

//MARK: - Direct/Static Dispatch
//Оптимизация компилятора inlining за счет невозможности наследования

struct Point {
    var x: Double
    var y: Double
}



