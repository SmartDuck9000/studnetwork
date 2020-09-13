//
//  ProfileDelegate.swift
//  studnetwork
//
//  Created by Георгий Куликов on 30.08.2020.
//  Copyright © 2020 Георгий Куликов. All rights reserved.
//

import Foundation

protocol ProfileDelegate {
    func updateUser(user: User) throws
    func getUser(complition: @escaping (_ user: User?) -> ())
    func exit()
}
