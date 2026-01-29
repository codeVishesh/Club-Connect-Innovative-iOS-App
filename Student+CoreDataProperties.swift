//
//  Student+CoreDataProperties.swift
//  Club_Connect
//
//  Created by student on 17-04-2024.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?

}

extension Student : Identifiable {

}
