//
//  NotificationBuilder.swift
//  Builder
//
//  Created by Alexander Rubtsov on 05.07.2021.
//

import Foundation
import UserNotifications

protocol NotificationBuilderProtocol: AnyObject  {
    
    // You should call it first
    @discardableResult
    func erase() -> Self
    
    @discardableResult
    func build(title: String) -> Self
    
    @discardableResult
    func build(subtitle: String) -> Self
    
    @discardableResult
    func build(badge: Int8) -> Self
    
    @discardableResult
    func build(attachments: [UNNotificationAttachment]) -> Self
    
    var content: UNNotificationContent { get }
}

final class NotificationBuilder {
    
    private var _content = UNMutableNotificationContent()
    
}

extension NotificationBuilder: NotificationBuilderProtocol {
    
    func erase() -> Self {
        _content = UNMutableNotificationContent()
        return self
    }
    
    func build(title: String) -> Self {
        _content.title = title
        return self
    }
    
    func build(subtitle: String) -> Self {
        _content.subtitle = subtitle
        return self
    }
    
    func build(badge: Int8) -> Self {
        _content.badge = NSNumber(value: badge)
        return self
    }
    
    func build(attachments: [UNNotificationAttachment]) -> Self {
        _content.attachments = attachments
        return self
    }
    
    var content: UNNotificationContent {
        _content.copy() as? UNNotificationContent ?? UNNotificationContent()
    }
    
}
