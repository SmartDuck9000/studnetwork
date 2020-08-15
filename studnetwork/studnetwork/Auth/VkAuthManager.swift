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
    
    let vkAppId: String = ""
    let vkSdk: VKSdk = VKSdk.initialize(withAppId: "")
    
    init(scope: [String], controller: UIViewController) {
        self.scope = scope
        self.presentController = controller
        super.init()
        
        vkSdk.register(self)
        vkSdk.uiDelegate = self
    }
    
    func auth() {
        VKSdk.authorize(scope)
    }
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        if let token = result.token {
            print("token: \(String(describing: token))")
        } else if let error = result.error {
            print("token: \(String(describing: error.localizedDescription))")
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
