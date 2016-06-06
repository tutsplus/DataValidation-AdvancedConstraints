//
//  User.swift
//  Validation
//
//  Created by Bart Jacobs on 06/06/16.
//  Copyright © 2016 Envato Tuts+. All rights reserved.
//

import CoreData
import Foundation

class User: NSManagedObject {

    let errorDomain = "UserErrorDomain"

    enum UserErrorType: Int {
        case InvalidEmail
        case InvalidFirst
        case InvalidLast
        case InvalidAge
        case OneOrMoreNotes
    }
    
    func validateFirst(value: AutoreleasingUnsafeMutablePointer<AnyObject?>) throws {
        var error: NSError? = nil;

        if let first = value.memory as? String {
            if first == "" {
                let errorType = UserErrorType.InvalidFirst
                error = NSError(domain: errorDomain, code: errorType.rawValue, userInfo: [ NSLocalizedDescriptionKey : "The first name cannot be empty." ] )
            }

        } else {
            let errorType = UserErrorType.InvalidFirst
            error = NSError(domain: errorDomain, code: errorType.rawValue, userInfo: [ NSLocalizedDescriptionKey : "The first name cannot be blank." ] )
        }

        if let error = error {
            throw error
        }
    }

    func validateEmail(value: AutoreleasingUnsafeMutablePointer<AnyObject?>) throws {
        var error: NSError? = nil

        if let email = value.memory as? String {
            let regex = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
            let predicate = NSPredicate(format: "SELF MATCHES %@", regex)

            if !predicate.evaluateWithObject(email) {
                let errorType = UserErrorType.InvalidEmail
                error = NSError(domain: errorDomain, code: errorType.rawValue, userInfo: [ NSLocalizedDescriptionKey : "The email address is invalid." ] )
            }

        } else {
            let errorType = UserErrorType.InvalidEmail
            error = NSError(domain: errorDomain, code: errorType.rawValue, userInfo: [ NSLocalizedDescriptionKey : "The email address is invalid." ] )
        }
        
        if let error = error {
            throw error
        }
    }

    override func validateForDelete() throws {
        try super.validateForDelete()

        var error: NSError? = nil

        if let notes = notes {
            if notes.count > 0 {
                let errorType = UserErrorType.OneOrMoreNotes
                error = NSError(domain: errorDomain, code: errorType.rawValue, userInfo: [ NSLocalizedDescriptionKey : "A user with notes cannot be deleted.." ] )
            }
        }

        if let error = error {
            throw error
        }
    }

}
