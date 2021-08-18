//
//  Card+CoreDataProperties.swift
//  CoreDataFRC
//
//  Created by Deniz Kaplan on 24.06.2021.
//
//

import Foundation
import CoreData


extension Card {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Card> {
        return NSFetchRequest<Card>(entityName: "Card")
    }

    @NSManaged public var number: String?
    @NSManaged public var name: String?
    @NSManaged public var balance: NSDecimalNumber?
    @NSManaged public var type: String?

}

extension Card : Identifiable {

}

extension Card {

	func name(for number: Int) -> String {
		switch number {
		case 1,5,10: return "Classic"
		case 2,4,6: return "Gold"
		case 3,9,7: return "Platinum"
		default:
			return "SomeName"
		}
	}

	func type(for number: Int) -> String {
		switch number {
		case 1,5,10: return "Visa"
		case 2,4,6: return "MIR"
		case 3,9,7: return "MasterCard"
		default:
			return "SomeType"
		}
	}
}
