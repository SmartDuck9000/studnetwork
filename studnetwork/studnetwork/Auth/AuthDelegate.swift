//
//  AuthProtocol.swift
//  studnetwork
//
//  Created by Георгий Куликов on 08.08.2020.
//  Copyright © 2020 Георгий Куликов. All rights reserved.
//

import Foundation

protocol AuthDelegate {
    var token: String { get set }
    func auth()
}
