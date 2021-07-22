//
//  TableVC.swift
//  ScrollAndTableLab
//
//  Created by Leonid Serebryanyy on 24.05.2021.
//

import Foundation
import UIKit


class Quote {
	var text: String = ""
	var learned: Bool = false
	
	init(name: String) {
		self.text = name
	}
}


class WisdomViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	let quoteReuseId = "quoteReuseId"
	
	private lazy var tableView: UITableView = {
		let tv = UITableView(frame: .zero, style: .plain)
		tv.translatesAutoresizingMaskIntoConstraints = false
		tv.delegate = self
		tv.dataSource = self
//		tv.backgroundColor = .b()
		tv.register(WisdomCell.self, forCellReuseIdentifier:quoteReuseId)
		tv.rowHeight = UITableView.automaticDimension
		tv.estimatedRowHeight = 50
		return tv
	}()
	
	override func viewDidLoad() {
		view.addSubview(tableView)
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
		])
	}
	
	private var quotes = [
		"delegate", "dataSource", "reusing cells", "offset", "inset", "hi\nhow\nare\nyou"
	].map{Quote(name: $0)}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return quotes.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: quoteReuseId, for: indexPath) as! WisdomCell
		
		let quote = quotes[indexPath.row]
		cell.setName(quote.text)
		cell.setVisited(quote.learned)
				
		cell.cellTicked = {[weak self] cell in
			guard let self = self else {return}
			// делаем что-нибудь с ячейкой.
			// не забываем циклы удержания
			
//			self.quoteReuseId
			
			quote.learned = !quote.learned
			cell.setVisited(quote.learned)
		}
		
		return cell
	}
		
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if indexPath.row == 1 {
			return UITableView.automaticDimension
		}

		let item = quotes[indexPath.row]
		var height = WisdomCell.heightFor(item.text, width: tableView.frame.width)
		if height < 50 {
			height = 50
		}
		return height
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
				
		let vc = UIViewController()
		vc.title = quotes[indexPath.row].text
		
		vc.view.backgroundColor = .randomColor()
		
		self.navigationController?.pushViewController(vc, animated: true)
		
//		let cell = tableView.cellForRow(at: indexPath) // получаем ячейку
	}
	
	
}
