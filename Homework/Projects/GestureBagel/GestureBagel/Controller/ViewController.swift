//
//  ViewController.swift
//  GestureBagel
//
//  Created by Alexander Rubtsov on 17.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var mainView: View?
    
    //MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        mainView = View()
        view = mainView
        mainView?.viewController = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


}

