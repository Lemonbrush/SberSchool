//
//  Enimal+CoreDataProperties.swift
//  CoreDataOld
//
//  Created by Alexander Rubtsov on 13.08.2021.
//
//

import Foundation
import CoreData


extension Enimal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Enimal> {
        return NSFetchRequest<Enimal>(entityName: "Enimal")
    }

    @NSManaged public var legs: Int16
    @NSManaged public var name: String?

}

extension Enimal : Identifiable {

}
