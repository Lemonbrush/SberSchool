//
//  ColorModel.swift
//  MVCColors
//
//  Created by Alexander Rubtsov on 11.07.2021.
//

import UIKit

protocol ColorManagerProtocol {
    func changeBackgroundColor(with newColor: UIColor)
}

struct ColorModel {
    
    var delegate: ColorManagerProtocol?
    
    init(_ delegate: ColorManagerProtocol) {
        self.delegate = delegate
    }
    
    func didChangeColor(with color: UIColor) {
        let oldColor = color
        let oldColorComponents = oldColor.cgColor.components
        
        guard let red = oldColorComponents?[0],
              let green = oldColorComponents?[1],
              let blue = oldColorComponents?[2],
              let alpha = oldColorComponents?[3] else { return }
        
        let newColor = UIColor(red: red - 0.1, green: green - 0.1, blue: blue - 0.1, alpha: alpha - 0.1)
        
        delegate?.changeBackgroundColor(with: newColor)
    }
}
