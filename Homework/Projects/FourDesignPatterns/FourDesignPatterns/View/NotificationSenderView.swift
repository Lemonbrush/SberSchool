//
//  ViewController.swift
//  FourDesignPatterns
//
//  Created by Alexander Rubtsov on 06.07.2021.
//

import UIKit

class NotificationSenderView: UIViewController, NotificationReceiverProtocol {

    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    private var notificationManager: NotificationSenderMediator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationManager = NotificationSenderMediator()
        notificationManager?.addReceiver(self)
    }
    
    @IBAction func sendButtonTapped(_ sender: Any) {
        notificationManager?.sendNotificationToMediator(with: textField.text ?? " ")
    }
    
    func receiveNotification(_ string: String) {
        print(string)
    }
    
}

