//
//  User+CoreDataProperties.swift
//  Validation
//
//  Created by Bart Jacobs on 06/06/16.
//  Copyright © 2016 Envato Tuts+. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension User {

    @NSManaged var age: Int16
    @NSManaged var email: String?
    @NSManaged var first: String?
    @NSManaged var last: String?
    @NSManaged var notes: NSSet?

}
