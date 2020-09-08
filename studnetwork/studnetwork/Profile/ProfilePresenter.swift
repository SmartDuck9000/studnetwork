//
//  ProfilePresenter.swift
//  studnetwork
//
//  Created by Георгий Куликов on 30.08.2020.
//  Copyright © 2020 Георгий Куликов. All rights reserved.
//

import Foundation

class ProfilePresenter {
    private var profileView: ProfileView
    private var profileModel: ProfileDelegate
    
    init(view: ProfileView, model: ProfileDelegate) {
        self.profileView = view
        self.profileModel = model
    }
    
    public func updateUser() {
        
    }
    
    public func getUser() {
        
    }
    
    public func exit() {
        
    }
}
