//
//  ViewController.swift
//  Autolayout
//
//  Created by Alexander Rubtsov on 12.07.2021.
//

import UIKit

class ViewController: UIViewController {

    var view1: UIView!
    var view2: UIView!
    var view3: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupViews()
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        printProperties(view: view1)
        printProperties(view: view2)
        printProperties(view: view3)
    }

    //MARK: - Helper functions
    
    func printProperties(view: UIView) {
        print(view.center)
        print(view.frame)
        print(view.bounds)
    }
    
    func setupViews() {
        
        view1 = createView(color: .white)
        view2 = createView(color: .blue)
        view3 = createView(color: .red)
        
        view.addSubview(view1)
        NSLayoutConstraint.activate([
            view1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            view1.topAnchor.constraint(equalTo: view.topAnchor),
            view1.widthAnchor.constraint(equalTo: view.widthAnchor),
            view1.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.33)
        ])
        
        view.addSubview(view2)
        NSLayoutConstraint.activate([
            view2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            view2.topAnchor.constraint(equalTo: view1.bottomAnchor),
            view2.widthAnchor.constraint(equalTo: view.widthAnchor),
            view2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.33)
        ])
        
        view.addSubview(view3)
        NSLayoutConstraint.activate([
            view3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            view3.topAnchor.constraint(equalTo: view2.bottomAnchor),
            view3.widthAnchor.constraint(equalTo: view.widthAnchor),
            view3.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.33)
        ])
    }
    
    func createView(color: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }

}

