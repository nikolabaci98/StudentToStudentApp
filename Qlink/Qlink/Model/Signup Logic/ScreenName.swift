//
//  Username.swift
//  Qlink
//
//  Created by Nikola Baci on 4/7/22.
//

import Foundation
import Parse
import UIKit

class ScreenName {
    
    var screenName: String
    var email: String
    var password: String
    
    init(screenName: String, email: String, password: String){
        self.screenName = screenName
        self.email = email
        self.password = password
    }
    
    func isValid() -> Bool {
        if screenName.count < 3 {
            return false
        } else {
            return true
        }
    }
    
    func createUser(_ delegate: ScreenNameViewController) {
        let user = PFUser()
        user.username = self.email
        user.password = self.password
        user.email = self.email
        user["screenName"] = self.screenName
        user["major"] = ""
        user["classStanding"] = ""
        user["bio"] = ""
        let imageData = UIImage(named: "profile_avatar.png")?.pngData()
        let file = PFFileObject(name: "image.png", data: imageData!)
        user["profileImage"] = file

        user.signUpInBackground { success, error in
            if let error = error {
                print(error)
            } else {
                delegate.confirmEmail()
            }
        }
    }
    
}
