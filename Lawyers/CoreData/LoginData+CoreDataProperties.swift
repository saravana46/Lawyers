//
//  LoginData+CoreDataProperties.swift
//  Lawyers
//
//  Created by Saravana on 03/11/22.
//

import Foundation
import CoreData


extension LoginData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LoginData> {
        return NSFetchRequest<LoginData>(entityName: "LoginData")
    }

    @NSManaged public var token: String?

}
