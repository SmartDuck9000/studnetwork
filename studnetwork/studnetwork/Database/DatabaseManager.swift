//
//  DatabaseManager.swift
//  studnetwork
//
//  Created by Георгий Куликов on 17.08.2020.
//  Copyright © 2020 Георгий Куликов. All rights reserved.
//

import UIKit
import CoreData

class DatabaseManager: DatabaseDelegate {
    
    private let persistentContainer = NSPersistentContainer(name: "LibraryDataModel")
    
    private var context: NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }
    
    func create(user: User) throws {
        self.context.insert(user)
        try self.context.save()
    }
    
    func read() throws -> [User] {
        let users = try self.context.fetch(User.fetchRequest() as NSFetchRequest<User>)
        return users
    }
    
    func update(user: User) throws {
        try self.context.save()
    }
    
    func delete(user: User) throws {
        self.context.delete(user)
        try self.context.save()
    }
    
    func initializeStack() {
        self.persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            
            print("Store loaded")
        }
    }
}
