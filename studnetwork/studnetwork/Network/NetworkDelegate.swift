//
//  NetworkDelegate.swift
//  studnetwork
//
//  Created by Георгий Куликов on 17.08.2020.
//  Copyright © 2020 Георгий Куликов. All rights reserved.
//

import Foundation

public protocol NetworkDelegate {
    func createUser(accessToken: String) -> String?
    func getUser(token: String) -> User?
    func update(user: User)
}
