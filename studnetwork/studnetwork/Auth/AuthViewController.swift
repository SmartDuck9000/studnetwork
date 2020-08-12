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
    
    private let authButtonColor = UIColor(red: 240 / 255, green: 92 / 255, blue: 0 / 255, alpha: 1)
    private let viewBackgroundColor = UIColor(red: 71 / 255, green: 168 / 255, blue: 77 / 255, alpha: 1)
    
    private var authButton = UIButton()
    private var authImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = VkAuthManager()
        presenter = AuthPresenter(view: self, model: manager)
        
        setupLayout()
    }
    
    private func setupLayout() {
        self.view.backgroundColor = viewBackgroundColor
        setupAuthImageView()
        setupAuthButton()
    }
    
    private func setupAuthImageView() {
        authImageView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        authImageView.contentMode = .scaleAspectFit
        authImageView.backgroundColor = authButtonColor
        authImageView.layer.cornerRadius = 0.8 * self.view.frame.width / 10
        
        self.view.addSubview(authImageView)
        authImageView.translatesAutoresizingMaskIntoConstraints = false;
        
        authImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.frame.height / 5).isActive = true
        authImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        authImageView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
        authImageView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
    }
    
    private func setupAuthButton() {
        authButton.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        authButton.backgroundColor = authButtonColor
        authButton.layer.cornerRadius = 10
        
        authButton.setTitle("Войти через ВК", for: .normal)
        authButton.titleLabel?.textColor = .white
        
        authButton.addTarget(self, action: #selector(auth), for: .touchUpInside)
        
        self.view.addSubview(authButton)
        authButton.translatesAutoresizingMaskIntoConstraints = false;
        
        authButton.topAnchor.constraint(equalTo: authImageView.bottomAnchor, constant: 200).isActive = true
        authButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        authButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.6).isActive = true
        authButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc private func auth() {
        self.presenter?.auth()
    }
}
