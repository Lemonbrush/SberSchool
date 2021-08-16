//
//  Account+CoreDataProperties.swift
//  CoreDataFRC
//
//  Created by Deniz Kaplan on 16.08.2021.
//
//

import Foundation
import CoreData

extension Account {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Account> {
        return NSFetchRequest<Account>(entityName: "Account")
    }

    @NSManaged public var balance: NSDecimalNumber?
    @NSManaged public var number: String?
    @NSManaged public var cards: Set<Card>?

}

// MARK: Generated accessors for cards
extension Account {

    @objc(addCardObject:)
    @NSManaged public func addToCards(_ value: Card)

    @objc(removeCardObject:)
    @NSManaged public func removeFromCards(_ value: Card)

    @objc(addCard:)
    @NSManaged public func addToCards(_ values: Set<Card>)

    @objc(removeCard:)
    @NSManaged public func removeFromCards(_ values: Set<Card>)

}

extension Account : Identifiable {

}
