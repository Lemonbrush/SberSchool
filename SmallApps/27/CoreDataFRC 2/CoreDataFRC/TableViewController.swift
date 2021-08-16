//
//  ChildViewController.swift
//  CoreDataFRC
//
//  Created by Deniz Kaplan on 24.06.2021.
//

import UIKit

// Добавить кнопку add account (рандом)
// add card (данные карты рандомны) -> UIAlertController с просьбой ввести id (number) счета
// добаввить кнопку remove all <- Алена

// таблица должна обновляться после каждого действия
final class TableViewController: UITableViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()

		tableView.rowHeight = UITableView.automaticDimension
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
		view.backgroundColor = .white
	}
}
