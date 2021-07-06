//
//  NotificationSenderMediator.swift
//  FourDesignPatterns
//
//  Created by Alexander Rubtsov on 06.07.2021.
//

import Foundation

protocol NotificationSenderProtocol {
    func sendNotificationToMediator(with string: String)
}

protocol NotificationReceiverProtocol {
    func receiveNotification(_ string: String)
}

class NotificationSenderMediator: NotificationSenderProtocol {
    
    private var receivers = [NotificationReceiverProtocol]()
    
    func addReceiver(_ receiver: NotificationReceiverProtocol) {
        receivers.append(receiver)
    }
    
    func sendNotificationToMediator(with string: String) {
        for receiver in receivers {
            receiver.receiveNotification(string)
        }
    }
}
