//
//  Note+CoreDataProperties.swift
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

extension Note {

    @NSManaged var contents: String?
    @NSManaged var createdAt: NSTimeInterval
    @NSManaged var title: String?
    @NSManaged var updatedAt: NSTimeInterval
    @NSManaged var user: User?

}
