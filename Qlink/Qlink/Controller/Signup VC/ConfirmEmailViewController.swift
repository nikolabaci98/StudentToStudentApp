//
//  ConfirmEmailViewController.swift
//  Qlink
//
//  Created by Nikola Baci on 4/7/22.
//

import UIKit
import Parse

class ConfirmEmailViewController: UIViewController {
    
    var confirmEmail: ConfirmEmail?
    
    @IBOutlet weak var confirmationEmailLabel: UILabel!
    @IBOutlet weak var incorrectEmailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let username = PFUser.current()?.username
        confirmationEmailLabel.text = "We sent a confirmation email to \(username ?? ""). Please verify your email address in order to proceed with Qlink"
        incorrectEmailLabel.text = "If the email is incorrect, then please start over."
        confirmEmail = ConfirmEmail(user: PFUser.current()!, self)
    }
    

    
    @IBAction func onStartOverPressed(_ sender: UIButton) {
        confirmEmail?.onStartOver()
    }
    
    func goToHome() {
        performSegue(withIdentifier: K.confirmEmailToTabVCSegue, sender: self)
    }
}
