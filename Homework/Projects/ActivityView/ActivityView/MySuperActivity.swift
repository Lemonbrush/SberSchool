//
//  MySuperActivity.swift
//  ActivityView
//
//  Created by Alexander Rubtsov on 11.07.2021.
//

import UIKit

class MySuperActivity: UIActivity {

    var _activityTitle: String = ""
    var _activityImage: UIImage?
    var activityItems = [Any]()
    var action: ([Any]) -> Void
    
    // MARK: - Init
    
    init(title: String, image: UIImage?, performAction: @escaping ([Any]) -> Void) {
        _activityTitle = title
        _activityImage = image
        action = performAction
        super.init()
    }
    
    //MARK: - Functions
    
    override var activityTitle: String? {
        return _activityTitle
    }
    
    override var activityImage: UIImage? {
        return _activityImage
    }
    
    // Setting up the action category
    override var activityType: UIActivity.ActivityType? {
        return UIActivity.ActivityType("Alexanderrub.ActivityView")
    }
    
    override class var activityCategory: UIActivity.Category {
        return .action
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return true
    }
    
    override func prepare(withActivityItems activityItems: [Any]) {
        self.activityItems = activityItems
    }
    
    override func perform() {
        action(activityItems)
        activityDidFinish(true)
    }
}
