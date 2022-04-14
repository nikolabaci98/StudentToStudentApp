//
//  File.swift
//  Qlink
//
//  Created by Nikola Baci on 4/7/22.
//

import Foundation

class Email {
    
    var email: String
    
    init(email: String) {
        self.email = email
    }
    
    func isValid() -> Bool {
        /*
         ^ is for the beginning of the string
         [a-zA-Z]+ is one or more letters
         \. is for a period
         [a-zA-Z]+ is one or more letters
         [0-9][0-9] is for two digits
         $ is for the end of string
         */
        let emailPattern = #"^[a-zA-Z]+\.[a-zA-Z]+[0-9][0-9]$"#
        //the result will always be nil if the email
        //has not the patter: john.doe69
        let result = self.email.range(of: emailPattern, options: .regularExpression)

        
        if result == nil {
            return false
        }
        return true
    }
}
