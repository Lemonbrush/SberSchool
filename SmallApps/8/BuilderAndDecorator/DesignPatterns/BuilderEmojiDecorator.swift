//
//  EmojiNotificationBuilderDecorator.swift
//  DesignPatterns
//
//  Created by Deniz Kaplan on 05.07.2021.
//

import UserNotifications

final class BuilderEmojiDecorator {

	private let builder: NotificationBuilderProtocol

	init(builder: NotificationBuilderProtocol) {
		self.builder = builder
	}

	convenience init() {
		self.init(builder: NotificationBuilder())
	}
}

extension BuilderEmojiDecorator: NotificationBuilderProtocol {

	func erase() -> Self {
		builder.erase()
		return self
	}

	func build(title: String) -> Self {
		builder.build(title: "Custom" + title + "👍")
		return self
	}

	func build(subtitle: String) -> Self {
		builder.build(subtitle: subtitle + "👍")
		return self
	}

	func build(badge: Int8) -> Self {
		builder.build(badge: badge)
		return self
	}

	func build(attachments: [UNNotificationAttachment]) -> Self {
		builder.build(attachments: attachments)
		return self
	}

	var content: UNNotificationContent {
		builder.content
	}
}

