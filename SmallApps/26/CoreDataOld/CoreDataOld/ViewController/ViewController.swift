//
//  ViewController.swift
//  CoreDataOld
//
//  Created by Deniz Kaplan on 20.06.2021.
//

import UIKit
import CoreData

    var posts: [NSManagedObject] = []

/// Добавить новую сущность (Entity)  человека с атрибутами: имя, возраст, пол
/// 3 - лейбла + текстфилда: Имя [] Возраст [] Пол []
/// + кнопка: заполнить
/// + кнопка: распечатать, которая печатает в лог сохраненные данные
/// + кнопка: удалить все
/// Для гениев:
/// SearchBar или текстфилд, который будет влиять на результат печати (можно в формате предиката)
final class ViewController: UIViewController {

	private let mainView = MainView()
	private let stack = NewStack.shared
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let coreDataService = (UIApplication.shared.delegate as! AppDelegate).coreDataService
	
	override func loadView() {
		self.view = mainView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
          
        let managedContext = appDelegate.persistentContainer.viewContext
          
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Post")
          
        do {
            posts = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        setActions()
        
        // Old version
        
        let oldContext = coreDataService.backgroundContext
        oldContext.performAndWait {
            for _ in 0...10 {
                let enimal = Enimal(context: oldContext)
                enimal.legs = 3
                enimal.name = "Kapibara"
            }
            
            try? oldContext.save()
        }
	}
	
	override func viewWillAppear(_ animated: Bool) {
		self.navigationController?.setNavigationBarHidden(true, animated: false)
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
	}
	
	private func setActions() {
		mainView.actionOnButtonTap1 = {
            self.saveObject()
		}
		
		mainView.actionOnButtonTap2 = {
            self.deleteAllData()
		}
		
		mainView.actionOnButtonTap3 = {
            self.printAll()
		}
	}
    
    // MARK: - CoreData functions
    
    func printAll() {
        //let managedContext = appDelegate.persistentContainer.viewContext
        
        // Old version
        let managedContext = coreDataService.mainContext
        
        managedContext.performAndWait {
            
            let request =  NSFetchRequest<Enimal>(entityName: "Enimal")
            let enimals = try? request.execute()
            
            print(enimals)
        }
    }
    
    func saveObject() {
        guard let appDelegate =
           UIApplication.shared.delegate as? AppDelegate else {
           return
         }
         
         let managedContext = appDelegate.persistentContainer.viewContext
         
         let entity = NSEntityDescription.entity(forEntityName: "Post",
                                      in: managedContext)!
         
         let person = NSManagedObject(entity: entity,
                                      insertInto: managedContext)
         
         person.setValue("Name", forKeyPath: "author")
         
         do {
           try managedContext.save()
           posts.append(person)
         } catch let error as NSError {
           print("Could not save. \(error), \(error.userInfo)")
         }
    }

    func deleteAllData() {
        appDelegate.persistentContainer.viewContext.performAndWait {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Post")
            fetchRequest.returnsObjectsAsFaults = false
            do {
                let results = try appDelegate.persistentContainer.viewContext.fetch(fetchRequest)
                for object in results {
                    guard let objectData = object as? NSManagedObject else {continue}
                    appDelegate.persistentContainer.viewContext.delete(objectData)
                }
            } catch let error {
                print("Detele all data error :", error)
            }
        }
    }


}

