//
//  ViewController.swift
//  KeyChainApp
//
//  Created by Deniz Kaplan on 21.06.2021.
//

import UIKit

class ViewController: UIViewController {

	private let service = KeychainService()
	private let defaultsService = DefaultStorageService()
	private let fileManager = FileManager.default

	override func viewDidLoad() {
		super.viewDidLoad()
		let somth = SavebleClass()
		print(service.save(value: "123123qwerty", queryItem: GenericPassword(key: "userPassoword")))
		UserDefaults.standard.setValue("HELLO", forKey: "WORLD")
		defaultsService.save(object:somth , for: "person")

		let data = try? JSONEncoder().encode(somth)

		let documentsUrl = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first

		let result = fileManager.createFile(atPath: documentsUrl?.appendingPathComponent("SavebleClass.json").path ?? "",
							   contents: data, attributes: nil)


		print("save result: \(result)")

		let newData = fileManager.contents(atPath: documentsUrl?.appendingPathComponent("SavebleClass.json").path ?? "")
		let resultsClass = try? JSONDecoder().decode(SavebleClass.self, from: newData ?? Data())
		print(resultsClass?.name)

		try? Data().write(to: documentsUrl!.appendingPathComponent("SavebleClass.json"))
		try? "qweqwewqeqwe".write(to: documentsUrl!.appendingPathComponent("SavebleClass.json"),
								  atomically: true,
								  encoding: .utf8)

		let urls = try? fileManager.contentsOfDirectory(at: documentsUrl!,
														includingPropertiesForKeys: [.creationDateKey, .isDirectoryKey, .contentTypeKey, .fileSizeKey, .nameKey],
										options: .skipsHiddenFiles)
		urls?.forEach{
			let resources = try? $0.resourceValues(forKeys: Set([.creationDateKey, .isDirectoryKey, .contentTypeKey, .fileSizeKey, .nameKey]))
			print(resources?.name)
			print(resources?.fileSize)
		}
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		let password: String? = service.object(for: GenericPassword(key: "userPassoword"))
		print(password)
		print()
	}
}

