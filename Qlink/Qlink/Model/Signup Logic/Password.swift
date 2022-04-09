//
//  Password.swift
//  Qlink
//
//  Created by Nikola Baci on 4/7/22.
//

import Foundation

class Password {
    
    var password: String
    
    init(password: String) {
        self.password = password
    }
    
    func isValid() -> Bool {
        //The only constrain for the password for now
        //is that it needs to ba at least 6 characters long

        if password.count < 6 {
            return false
        } else {
            return true
        }
    }
    
}
