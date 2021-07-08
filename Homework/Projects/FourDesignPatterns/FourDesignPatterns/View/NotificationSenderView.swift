//
//  ViewController.swift
//  FourDesignPatterns
//
//  Created by Alexander Rubtsov on 06.07.2021.
//

import UIKit

class NotificationSenderView: UIViewController {

    //MARK: - @IBOutlet
    
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var subscribeButton1: SubscribableButton!
    @IBOutlet weak var subscribeButton2: SubscribableButton!
    @IBOutlet weak var subscribeButton3: SubscribableButton!
    
    @IBOutlet weak var messageLabel1: UILabel!
    @IBOutlet weak var messageLabel2: UILabel!
    @IBOutlet weak var messageLabel3: UILabel!
    
    @IBOutlet weak var undoButton1: MementoButton!
    @IBOutlet weak var undoButton2: MementoButton!
    @IBOutlet weak var undoButton3: MementoButton!
    
    //MARK: - Variables
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = SubscribableUnit(id: 1, label: messageLabel1, subscribeButton: subscribeButton1, mementoButton: undoButton1)
        _ = SubscribableUnit(id: 2, label: messageLabel2, subscribeButton: subscribeButton2, mementoButton: undoButton2)
        _ = SubscribableUnit(id: 3, label: messageLabel3, subscribeButton: subscribeButton3, mementoButton: undoButton3)
    }
    
    @IBAction func sendButtonTapped(_ sender: Any) {
        NotificationSenderMediator.shared.sendNotificationToMediator(with: textField.text ?? " ")
    }
    
    @IBAction func unitButtonTapped(_ sender: UIButton) {
        guard let unitButton = sender as? UnitButtonProtocol else { return }
        
        unitButton.pressed()
    }
    
    @IBAction func subscribeButtonTapped(_ sender: UIButton) {
        guard let unitButton = sender as? UnitButtonProtocol else { return }
        
        unitButton.pressed()
    }
}

