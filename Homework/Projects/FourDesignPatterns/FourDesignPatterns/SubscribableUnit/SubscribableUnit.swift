//
//  SubscribableButton.swift
//  FourDesignPatterns
//
//  Created by Alexander Rubtsov on 08.07.2021.
//

import UIKit

protocol MementoProtocol {
    var message: String { get set }
}

class SubscribableUnit: NotificationReceiverProtocol, MementoProtocol {
    var id: Int
    
    var message: String {
        get {
            return messageLabel.text ?? ""
        }
        
        set {
            messageLabel.text = newValue
        }
    }
    
    var undoMementoStack: UndoMementoStack!
    
    weak var messageLabel: UILabel!
    weak var subscribeButton: SubscribableButton!
    weak var mementoButton: MementoButton!
    
    private var isSubscribed = false
    
    init(id: Int, label: UILabel, subscribeButton: SubscribableButton, mementoButton: MementoButton) {
        self.id = id
        self.messageLabel = label
        self.subscribeButton = subscribeButton
        self.mementoButton = mementoButton
        self.subscribeButton.delegate = self
        self.mementoButton.delegate = self
        
        self.undoMementoStack = UndoMementoStack(self)
    }
    
    //MARK: - Functions
    
    func receiveNotification(_ string: String) {
        messageLabel?.text = string
        undoMementoStack.saveSnapshot()
    }
    
    func subscribePressed() {
        if isSubscribed {
            subscribeButton.setTitle("Не подписан", for: .normal)
            subscribeButton.backgroundColor = .systemRed
            isSubscribed = false
            NotificationSenderMediator.shared.removeReceiver(self)
        } else {
            subscribeButton.setTitle("Подписан", for: .normal)
            subscribeButton.backgroundColor = .systemGreen
            isSubscribed = true
            NotificationSenderMediator.shared.addReceiver(self)
        }
    }
}
