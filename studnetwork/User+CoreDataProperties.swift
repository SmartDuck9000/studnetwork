//
//  User+CoreDataProperties.swift
//  studnetwork
//
//  Created by Георгий Куликов on 26.08.2020.
//  Copyright © 2020 Георгий Куликов. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

}
