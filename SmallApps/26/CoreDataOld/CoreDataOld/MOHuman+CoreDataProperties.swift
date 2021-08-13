//
//  MOHuman+CoreDataProperties.swift
//  CoreDataOld
//
//  Created by Deniz Kaplan on 13.08.2021.
//
//

import Foundation
import CoreData


extension MOHuman {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MOHuman> {
        return NSFetchRequest<MOHuman>(entityName: "MOHuman")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var gender: String?

	var genderType: Gender { Gender(rawValue: self.gender ?? "other") }
}

extension MOHuman : Identifiable {

}

extension MOHuman {
	enum Gender: String {
		case male
		case female
		case other

		init(rawValue: String) {
			switch rawValue {
			case "male": self = .male
			case "female": self = .female
			default: self = .other
			}
		}
	}
}
