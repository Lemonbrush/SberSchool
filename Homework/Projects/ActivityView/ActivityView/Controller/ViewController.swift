//
//  ViewController.swift
//  ActivityView
//
//  Created by Alexander Rubtsov on 10.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var mainView = MainView()

    //MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        
        self.view = mainView
        mainView.viewController = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    //MARK: - Functions
    
    func showActivityView(with image: UIImage) {
        let items = [image]
        
        //custom item
        let customItem = MySuperActivity(title: "Frrrrrrr...", image: UIImage(systemName: "heart.fill")) { sharedItems in
            self.mainView.purrMode()
        }
        
        let activityView = UIActivityViewController(activityItems: items, applicationActivities: [customItem])
        activityView.excludedActivityTypes = [.postToFlickr, .postToVimeo, .saveToCameraRoll, .assignToContact]
        
        present(activityView, animated: true, completion: nil)
    }
}
