//
//  ViewController.swift
//  DesignPatterns
//
//  Created by Deniz Kaplan on 05.07.2021.
//

import UIKit

class ViewController: UIViewController {

	private lazy var button: UIButton = {
		let button = UIButton(type: .system)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Show notification", for: .normal)
		button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
		return button
	}()


	let builder: NotificationBuilderProtocol = BuilderEmojiDecorator()

	override func viewDidLoad() {
		super.viewDidLoad()

		view.addSubview(button)
		NSLayoutConstraint.activate([
			button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200),
			button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			button.heightAnchor.constraint(equalToConstant: 44),
			button.widthAnchor.constraint(equalToConstant: 150),
		])

	}

}

private extension ViewController {

	@objc func buttonTapped() {
		let content = builder
							.erase()
							.build(title: "Some Notification")
							.build(subtitle: "Subtitle")
							.content

		let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
		let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
		UNUserNotificationCenter.current().add(request) { error in  print(error?.localizedDescription) }
	}
}

