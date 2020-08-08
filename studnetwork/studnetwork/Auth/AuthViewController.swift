//
//  AuthViewController.swift
//  studnetwork
//
//  Created by Георгий Куликов on 08.08.2020.
//  Copyright © 2020 Георгий Куликов. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    private var presenter: AuthPresenter?
    
    private var authButton = UIButton()
    
    private var headerImageView = UIImageView()
    private var footerImageView = UIImageView()
    private var leftSideImageView = UIImageView()
    private var rightSideImageView = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = VkAuthManager()
        presenter = AuthPresenter(view: self, model: manager)
        
        setupLayout()
    }
    
    private func setupLayout() {
        setupAuthButton()
        
        setupHeader()
        setupLeftSide()
        setupRightSide()
        setupFooter()
    }
    
    private func setupAuthButton() {
        authButton.addTarget(self, action: #selector(auth), for: .touchUpInside)
    }
    
    private func setupHeader() {
        
    }
    
    private func setupFooter() {
        
    }
    
    private func setupLeftSide() {
        
    }
    
    private func setupRightSide() {
        
    }
    
    @objc private func auth() {
        self.presenter?.auth()
    }
}
