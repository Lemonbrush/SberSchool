//
//  MOAnimal+CoreDataProperties.swift
//  CoreDataOld
//
//  Created by Deniz Kaplan on 22.06.2021.
//
//

import Foundation
import CoreData


extension MOAnimal {

	enum Gender: String {
		case male
		case female
		case trasformable
	}

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MOAnimal> {
        return NSFetchRequest<MOAnimal>(entityName: "MOAnimal")
    }
    @NSManaged public var legs: Int16
    @NSManaged public var name: String
	@NSManaged public var age: Int16
}

extension MOAnimal : Identifiable {

}
