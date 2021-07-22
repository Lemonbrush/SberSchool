//
//  ViewController.swift
//  S2.Collections
//
//  Created by Leonid Serebryanyy on 19.07.2021.
//

import UIKit

class ScrollLabViewController: UIViewController {
	
	private lazy var button: UIButton = {
		let v = UIButton(type: .custom)
		v.setTitle("wow", for: .normal)
		v.translatesAutoresizingMaskIntoConstraints = false
		v.setTitleColor(UIColor.secondaryLabel, for: .normal)
		v.addTarget(self, action: #selector(hide), for: .touchUpInside)
		return v
	}()

	private lazy var scrollView: UIScrollView = {
		let v = UIScrollView()
		v.translatesAutoresizingMaskIntoConstraints = false
		v.backgroundColor = UIColor.randomColor()
		
//		v.maximumZoomScale = 2
//		v.minimumZoomScale = 0.05
		
		v.delegate = self
		v.bounces = false
		v.keyboardDismissMode = .interactive
		return v
	}()
	
	private lazy var textField: UITextField = {
		let v = UITextField()
		v.translatesAutoresizingMaskIntoConstraints = false
		v.backgroundColor = .randomColor()
		return v
	}()
	
	override func viewDidLoad() {
		view.backgroundColor = .cyan
		
		scrollView.delegate = self
		
		scrollView.contentInset = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
		
		view.addSubview(scrollView)
		scrollView.addSubview(textField)
		scrollView.addSubview(button)
		
		NSLayoutConstraint.activate([
			scrollView.topAnchor.constraint(equalTo: view.topAnchor),
			scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
		])
		
		NSLayoutConstraint.activate([
			textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			textField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 3/4),
			textField.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor, constant: 200),
		])
		
		NSLayoutConstraint.activate([
			button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 3/4),
			button.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor, constant: 0),
		])
		
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
	}
}

// MARK: - Actions
extension ScrollLabViewController {
	
	@objc private func hide() {
		textField.resignFirstResponder()
	}
	
	@objc private func keyboardWillShow(notification: Notification) {
		let info = notification.userInfo!
		let keyboardFrame: CGRect = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
		let duration = info[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
		let tabbarHeight = tabBarController?.tabBar.frame.size.height ?? 0
		
		UIView.animate(withDuration: duration, animations: { () -> Void in
//			self.bottomConstraint.constant = -keyboardFrame.height + tabbarHeight
			self.scrollView.contentInset = UIEdgeInsets(
				top: -keyboardFrame.height,
				left: 0,
				bottom: keyboardFrame.height,
				right: 0
			)
		})
	}
	
	@objc private func keyboardWillHide(notification: Notification) {
		let info = notification.userInfo!
		let duration = info[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
		
		UIView.animate(withDuration: duration, animations: { () -> Void in
			self.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		})
	}
}

extension ScrollLabViewController: UIScrollViewDelegate {
	
}
