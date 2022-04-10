//
//  Login.swift
//  Qlink
//
//  Created by Nikola Baci on 4/9/22.
//

import Foundation
import Parse
class Login {
    var email: String
    var password: String
    var delegate: LoginViewController
    
    init(email: String, password: String, _ delegate: LoginViewController){
        self.email = email + K.emailDomain
        self.password = password
        self.delegate = delegate
    }
    
    func userLogin() {
        PFUser.logInWithUsername(inBackground: self.email, password: self.password) {
          (user: PFUser?, error: Error?) -> Void in
          if user != nil {
              self.delegate.goToHome()
          } else {
              self.delegate.errorEmailOrPasswordTextField.isHidden = false
          }
        }
    }
}
