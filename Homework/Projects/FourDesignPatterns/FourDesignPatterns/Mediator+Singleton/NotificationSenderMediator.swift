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
    var id: Int { get set }
    func receiveNotification(_ string: String)
}

class NotificationSenderMediator: NotificationSenderProtocol {
    
    private var receivers = [NotificationReceiverProtocol]()
    
    static var shared: NotificationSenderMediator = {
       return NotificationSenderMediator()
    }()
    
    func addReceiver(_ receiver: NotificationReceiverProtocol) {
        receivers.append(receiver)
    }
    
    func removeReceiver(_ receiver: NotificationReceiverProtocol) {
        for (i, checkableReceiver) in receivers.enumerated() {
            if checkableReceiver.id == receiver.id {
                receivers.remove(at: i)
            }
        }
    }
    
    func sendNotificationToMediator(with string: String) {
        for receiver in receivers {
            receiver.receiveNotification(string)
        }
    }
}
