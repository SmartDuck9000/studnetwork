//
//  ProfileModel.swift
//  studnetwork
//
//  Created by Георгий Куликов on 30.08.2020.
//  Copyright © 2020 Георгий Куликов. All rights reserved.
//

import UIKit

class ProfileModel: ProfileDelegate {
    let networkManager: NetworkDelegate
    let databaseManager: DatabaseDelegate
    
    init(networkManager: NetworkDelegate, databaseManager: DatabaseDelegate) {
        self.networkManager = networkManager
        self.databaseManager = databaseManager
    }
    
    func updateUser(user: User) throws {
        try databaseManager.update(user: user)
    }
    
    func getUser(complition: @escaping (User?) -> ()) {
        do {
            let users = try databaseManager.read()
            if users.count == 1 {
                guard let token = users[0].token else {
                    complition(nil)
                    return
                }
                networkManager.getUser(token: token, complition: complition)
            } else {
                complition(nil)
                return
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func exit() {
        do {
            let users = try databaseManager.read()
            if users.count == 1 {
                try databaseManager.delete(user: users[0])
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
