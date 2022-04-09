//
//  ConfirmEmailViewController.swift
//  Qlink
//
//  Created by Nikola Baci on 4/7/22.
//

import UIKit
import Parse

class ConfirmEmailViewController: UIViewController {
    
    var timer: Timer! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(isEmailConfirmed), userInfo: nil, repeats: true)
        if PFUser.current() == nil {
            print("there is no user")
        }
    }
    
    @objc func isEmailConfirmed() {
        PFUser.current()?.fetchInBackground(block: { user, error in
            if error == nil {
                let isVerified = user?["emailVerified"] as! Bool
                if isVerified {
                    self.timer.invalidate()
                    self.goToHome()
                }
            }
            
        })
    }
    
    func goToHome() {
        performSegue(withIdentifier: K.confirmEmailToHomeSegue, sender: self)
    }
}
