//
//  DatabaseDelegate.swift
//  studnetwork
//
//  Created by Георгий Куликов on 17.08.2020.
//  Copyright © 2020 Георгий Куликов. All rights reserved.
//

import Foundation

public protocol DatabaseDelegate {
    func create(user: User) throws
    func read() throws -> [User]
    func update(user: User) throws
    func delete(user: User) throws
}
