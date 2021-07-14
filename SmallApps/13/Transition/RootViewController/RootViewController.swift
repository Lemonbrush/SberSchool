//
//  ViewController.swift
//  RootViewController
//
//  Created by Alexander Rubtsov on 07.07.2021.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .green
        let button = UIButton(frame: CGRect(x: 50, y: 50, width: 150, height: 150))
        button.setTitle("Next", for: .normal)
        button.addTarget(self, action: #selector(nextVC), for: .touchUpInside)
        button.backgroundColor = UIColor.yellow
        self.view.addSubview(button)
    }
    
    @objc func nextVC() {
        let vc = UIViewController()
        
        let transition = CATransition()
        transition.duration = 1.5
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        transition.type = .push
        transition.subtype = .fromTop
        
        navigationController?.view.layer.add(transition, forKey: "transition")
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

