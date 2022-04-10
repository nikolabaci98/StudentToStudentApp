//
//  ConfirmEmail.swift
//  Qlink
//
//  Created by Nikola Baci on 4/10/22.
//

import Foundation
import Parse

class ConfirmEmail {
    
    var timer: Timer!
    var delegate: ConfirmEmailViewController!
    var user: PFUser!
    
    init(user: PFUser, _ delegate: ConfirmEmailViewController) {
        self.user = user
        self.delegate = delegate
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(isEmailConfirmed), userInfo: nil, repeats: true)
    }
    
    @objc func isEmailConfirmed() {
        self.user.fetchInBackground(block: { user, error in
            if error == nil {
                let isVerified = user?["emailVerified"] as! Bool
                if isVerified {
                    self.timer.invalidate()
                    self.delegate.goToHome()
                }
            }
            
        })
    }
    
    func onStartOver() {
        self.timer.invalidate()
        PFUser.logOut()
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = main.instantiateViewController(withIdentifier: "InitialScreenNav")
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let windowDelegate = windowScene.delegate as? SceneDelegate else {return}
        
        windowDelegate.window?.rootViewController = loginVC
    }
    
    
}
