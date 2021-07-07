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
        print("!!")
        navigationController?.pushViewController(vc, animated: true)
    }
}

