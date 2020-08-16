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
    
    var presentController: UIViewController
    var scope: [String]
    
    let vkAppId: String = "7569404"
    let vkSdk: VKSdk
    
    init(scope: [String], controller: UIViewController) {
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
            
            if state == .authorized {
                print("Auth")
            } else {
                VKSdk.authorize(self.scope, with: .disableSafariController)
            }
        }
    }
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        if let token = result.token {
            print("token: \(String(describing: token.accessToken))")
            print("expires in: \(token.expiresIn)")
        } else if let error = result.error {
            print("error: \(String(describing: error.localizedDescription))")
        }
    }
    
    func vkSdkUserAuthorizationFailed() {
        print("Auth failed")
    }
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        self.presentController.present(controller, animated: true, completion: nil)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print("vkSdkNeedCaptchaEnter, \(captchaError.debugDescription)")
    }
}
