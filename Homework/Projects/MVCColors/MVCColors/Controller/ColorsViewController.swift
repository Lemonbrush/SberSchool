//
//  ViewController.swift
//  MVCColors
//
//  Created by Alexander Rubtsov on 11.07.2021.
//

import UIKit

class ColorsViewController: UIViewController {
    
    var mainView = ColorsView()
    var colorModel: ColorModel?
    
    //MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        
        view = mainView
        mainView.viewControllerOwner = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorModel = ColorModel(self)
    }

    //MARK: - Functions
    
    func buttonTapped(with color: UIColor) {
        colorModel?.didChangeColor(with: color)
    }
    
}

extension ColorsViewController: ColorManagerProtocol {
    
    func changeBackgroundColor(with newColor: UIColor) {
        mainView.changeBackgroundColor(with: newColor)
    }
}

