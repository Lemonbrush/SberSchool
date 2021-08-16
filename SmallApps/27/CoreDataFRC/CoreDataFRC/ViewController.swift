//
//  ViewController.swift
//  CoreDataFRC
//
//  Created by Deniz Kaplan on 24.06.2021.
//

import UIKit
import CoreData

class ViewController: UIViewController {
	private let frc: NSFetchedResultsController<Card> = {
		let request = NSFetchRequest<Card>(entityName: "Card")
		request.sortDescriptors = [.init(key: "balance", ascending: true)]
		return NSFetchedResultsController(fetchRequest: request,
										  managedObjectContext: Container.shared.coreDataStack.viewContext,
										  sectionNameKeyPath: "name",
										  cacheName: nil)
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		setupChild()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)

		try? frc.performFetch()
	}

}

private extension ViewController {

	func setupChild() {
		let childViewController = TableViewController()
		view.addSubview(childViewController.view)
		childViewController.view.frame = view.frame
		addChild(childViewController)
		childViewController.didMove(toParent: self)
		childViewController.tableView.dataSource = self
	}
}

extension ViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		guard let sections = frc.sections else { return 0 }
		return sections[section].numberOfObjects
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let card = frc.object(at: indexPath)
		let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell")
		let type = card.type ?? "Card"
		let name = card.name ?? "Default"
		cell?.textLabel?.text = type + " - " + name
		cell?.detailTextLabel?.text = card.balance?.stringValue ?? "0.0" + "$"
		return cell ?? UITableViewCell()
	}

	func numberOfSections(in tableView: UITableView) -> Int {
		return frc.sections?.count ?? 0
	}
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return frc.sections?[section].name ?? "Section"
	}
}

