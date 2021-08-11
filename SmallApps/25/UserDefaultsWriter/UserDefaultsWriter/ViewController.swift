//
//  ViewController.swift
//  UserDefaultsWriter
//
//  Created by Alexander Rubtsov on 11.08.2021.
//

import UIKit

class ExampleClass: Codable {
    var name: String = "Alex"
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let exampleObject = ExampleClass()
        exampleObject.name = "Alex"
        
        UserDefaultsManager.set(object: exampleObject, forKey: "name")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let result = UserDefaultsManager<ExampleClass>.getObkect(forKey: "name") as! ExampleClass
        
        print(result.name)
    }

}

