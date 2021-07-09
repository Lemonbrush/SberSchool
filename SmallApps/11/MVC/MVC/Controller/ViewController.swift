//
//  ViewController.swift
//  MVC
//
//  Created by Alexander Rubtsov on 09.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var dummyModel: DummyModel?
    var mainView = DummyView()
    
    override func loadView() {
        super.loadView()
        view = mainView
        mainView.viewController = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainView.backgroundColor = .white
        
        dummyModel = DummyModel()
    }

    @objc func buttonPressed() {
        dummyModel?.updateDummyString(with: "Updated string")
        mainView.updateText(with: dummyModel?.dummyString ?? "")
    }
    
}

