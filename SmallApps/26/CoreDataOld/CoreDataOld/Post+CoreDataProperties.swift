//
//  Post+CoreDataProperties.swift
//  CoreDataOld
//
//  Created by Alexander Rubtsov on 13.08.2021.
//
//

import Foundation
import CoreData


extension Post {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Post> {
        return NSFetchRequest<Post>(entityName: "Post")
    }

    @NSManaged public var title: String?
    @NSManaged public var id: Int16
    @NSManaged public var author: String?

}

extension Post : Identifiable {

}
