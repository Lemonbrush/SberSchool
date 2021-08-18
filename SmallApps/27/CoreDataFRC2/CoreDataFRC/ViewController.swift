//
//  ViewController.swift
//  CoreDataFRC
//
//  Created by Deniz Kaplan on 24.06.2021.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let childViewController = TableViewController()
    
    private let buttonsStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        
        return stack
    }()
    
	private let frc: NSFetchedResultsController<Account> = {
		let request = NSFetchRequest<Account>(entityName: "Account")
		request.sortDescriptors = [.init(key: "balance", ascending: true)]
		return NSFetchedResultsController(fetchRequest: request,
										  managedObjectContext: Container.shared.coreDataStack.viewContext,
										  sectionNameKeyPath: "number",
										  cacheName: nil)
	}()

    // MARK: - Lifecycle
    
	override func viewDidLoad() {
		super.viewDidLoad()
		setupChild()
        
        buttonsStack.addArrangedSubview(createButton(title: "Add Card", selector: #selector(addCardButtonPressed)))
        buttonsStack.addArrangedSubview(createButton(title: "Add Account", selector: #selector(addAccountButtonPressed)))
        buttonsStack.addArrangedSubview(createButton(title: "Remove All", selector: #selector(removeAllButtonPressed)))
        
        view.addSubview(buttonsStack)
        
        setUpConstaraints()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)

		try? frc.performFetch()
	}
    
    // MARK: - Functions
    
    @objc func addCardButtonPressed() {
        
    }
    
    @objc func addAccountButtonPressed() {
        addAccount()
        childViewController.tableView.reloadData()
    }
    
    @objc func removeAllButtonPressed() {
        
    }
    

    // MARK: - Helper functions
    
    private func addAccount() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext

        let id = UUID().uuidString

        let accountEntity = NSEntityDescription.entity(forEntityName: "Account", in: managedContext)

        if let accEntity = accountEntity {
            let newAccount = NSManagedObject(entity: accEntity, insertInto: managedContext)
            newAccount.setValue(0.0, forKey: "balance")
            newAccount.setValue(id, forKey: "number")

            do {
                try managedContext.save()
            } catch let error as NSError {
                print("Could not save. (error), (error.userInfo)")
            }
        }
    }
    
    private func removeAll(entity: String) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print("Ошибка")
        }
    }
    
    private func createButton(title: String, selector: Selector) -> UIButton {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle(title, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 30
        
        button.addTarget(self, action: selector, for: .touchUpInside)
        
        return button
    }
    
    private func setUpConstaraints() {
        buttonsStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15).isActive = true
        buttonsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        buttonsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        buttonsStack.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
}

private extension ViewController {

	func setupChild() {
		
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
		let account = frc.object(at: indexPath)
		let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell")
		let type = "\(account.cards?.count ?? 0)"
		var name = ""
		account.cards?.forEach {
			let cardName = $0.name ?? "empty"
			name += "|" + cardName
		}
		cell?.textLabel?.text = type + " - " + name
		cell?.detailTextLabel?.text = account.balance?.stringValue ?? "0.0" + "$"
		return cell ?? UITableViewCell()
	}

	func numberOfSections(in tableView: UITableView) -> Int {
		return frc.sections?.count ?? 0
	}
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return frc.sections?[section].name ?? "Section"
	}
}

