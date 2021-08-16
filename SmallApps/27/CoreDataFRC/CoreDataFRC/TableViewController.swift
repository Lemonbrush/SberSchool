//
//  ChildViewController.swift
//  CoreDataFRC
//
//  Created by Deniz Kaplan on 24.06.2021.
//

import UIKit


final class TableViewController: UITableViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()

		tableView.rowHeight = UITableView.automaticDimension
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
		view.backgroundColor = .white
	}
}
