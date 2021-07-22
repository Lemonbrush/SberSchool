//
//  SpotCell.swift
//  ScrollAndTableLab
//
//  Created by Leonid Serebryanyy on 24.05.2021.
//

import UIKit


typealias SpotCellCall = (WisdomCell) -> Void


class WisdomCell: UITableViewCell {
		
	var cellTicked: SpotCellCall?
	
	static let titleFont = UIFont.systemFont(ofSize: 12)
		
	private lazy var title: UILabel = {
		let title = UILabel()
		title.numberOfLines = 0
		title.font = Self.titleFont
		title.translatesAutoresizingMaskIntoConstraints = false
		title.isOpaque = false
		return title
	}()
	
	private lazy var button: UIButton = {
		let button = UIButton()
		button.addTarget(self, action: #selector(ticked), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		contentView.addSubview(title)
		contentView.addSubview(button)
		self.setVisited(false)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override class var requiresConstraintBasedLayout: Bool {
		return true
	}
	
	override func updateConstraints() {
		NSLayoutConstraint.activate([
			title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
			title.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8),
			title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
		])
		
		NSLayoutConstraint.activate([
			button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
			button.leadingAnchor.constraint(equalTo: title.trailingAnchor, constant: 20),
			button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
			button.widthAnchor.constraint(equalToConstant: 40),
			button.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -4),

		])
		
		super.updateConstraints()
	}

	override func prepareForReuse() {
		self.setVisited(false)
	}

	// MARK: - Public
	
	func setName(_ name: String) {
		self.title.text = name
	}
	
	func setVisited(_ visited: Bool) {
		if visited {
			self.button.setTitle("✅", for: .normal)
			self.backgroundColor = .systemGreen
		} else {
			self.button.setTitle("⏺", for: .normal)
			self.backgroundColor = .systemFill
		}
	}
	
	// MARK: - Actions
	
	@objc
	private func ticked() {
		cellTicked?(self)
	}
		
	static func heightFor(_ text: String, width: CGFloat) -> CGFloat {

		let attributedString = NSAttributedString(string: text, attributes: [NSAttributedString.Key.font: titleFont])

		let rect = attributedString.boundingRect(
			with: CGSize(width: width - 72, height: .greatestFiniteMagnitude),
			options: .usesLineFragmentOrigin,
			context: nil
		)
		return rect.size.height + 16
	}
}
