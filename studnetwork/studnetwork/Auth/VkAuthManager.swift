//
//  AuthManager.swift
//  studnetwork
//
//  Created by Георгий Куликов on 08.08.2020.
//  Copyright © 2020 Георгий Куликов. All rights reserved.
//

import UIKit
import VK_ios_sdk

class VkAuthManager: NSObject, AuthDelegate, VKSdkDelegate, VKSdkUIDelegate {
    
    var token: String = ""
    
    var presentController: AuthViewController
    var scope: [String]
    
    let vkAppId: String = "7569404"
    let vkSdk: VKSdk
    
    init(scope: [String], controller: AuthViewController) {
        self.scope = scope
        self.presentController = controller
        self.vkSdk = VKSdk.initialize(withAppId: self.vkAppId)
        super.init()
        
        vkSdk.register(self)
        vkSdk.uiDelegate = self
    }
    
    func auth() {
        VKSdk.wakeUpSession(scope) { (state, error) in
            if let err = error {
                print(err.localizedDescription)
            }
            
            if state != .authorized {
                VKSdk.authorize(self.scope, with: .disableSafariController)
            }
        }
    }
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        if let error = result.error {
            print("error: \(String(describing: error.localizedDescription))")
            self.presentController.showError(title: "Ошибка авторизации", message: "Пожалуйста, повторите вход", actionTitle: "OK")
        } else if let token = result.token {
            let networkManager: NetworkDelegate = NetworkManager()
            let database: DatabaseDelegate = DatabaseManager()
            
            if let userToken = networkManager.createUser(accessToken: token.accessToken) {
                let user = User()
                user.token = userToken
                
                do {
                    try database.create(user: user)
                } catch {
                    print(error.localizedDescription)
                }
                
                self.presentController.presentProfile()
            } else {
                self.presentController.showError(title: "Ошибка авторизации", message: "Пожалуйста, повторите вход", actionTitle: "OK")
            }
        }
    }
    
    func vkSdkUserAuthorizationFailed() {
        self.presentController.showError(title: "Ошибка авторизации", message: "Пожалуйста, повторите вход", actionTitle: "OK")
    }
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        self.presentController.present(controller, animated: true, completion: nil)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print("vkSdkNeedCaptchaEnter, \(captchaError.debugDescription)")
    }
}
