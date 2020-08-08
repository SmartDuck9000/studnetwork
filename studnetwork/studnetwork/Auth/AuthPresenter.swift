//
//  AuthPresenter.swift
//  studnetwork
//
//  Created by Георгий Куликов on 08.08.2020.
//  Copyright © 2020 Георгий Куликов. All rights reserved.
//

import UIKit

class AuthPresenter: NSObject {
    private var view: AuthViewController
    private var authManager: AuthDelegate
    
    init(view: AuthViewController, model: AuthDelegate) {
        self.view = view
        self.authManager = model
    }
    
    public func auth() {
        authManager.auth()
    }
}
