//
//  ViewController.swift
//  Gesture
//
//  Created by Alexander Rubtsov on 16.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var mainView = GestureView()
    
    override func loadView() {
        super.loadView()
        
        view = mainView
        mainView.viewController = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


}

