//
//  ViewController.swift
//  interop
//
//  Created by Alexander Rubtsov on 25.08.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ObjCObject.printSuccessMessage("Success")
    }
}

