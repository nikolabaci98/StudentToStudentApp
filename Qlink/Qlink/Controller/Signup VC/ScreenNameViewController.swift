//
//  UsernameViewController.swift
//  Qlink
//
//  Created by Nikola Baci on 4/7/22.
//

import UIKit

class ScreenNameViewController: UIViewController {

    var email: String!
    var password: String!
    @IBOutlet weak var screenNameTextField: UITextField!
    @IBOutlet weak var errorScreenNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenNameTextField.becomeFirstResponder()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        screenNameTextField.becomeFirstResponder()
    }
    
    @IBAction func onSigupPressed(_ sender: UIBarButtonItem) {
        let screenName = ScreenName(screenName: screenNameTextField.text!, email: self.email, password: self.password)
        
        if screenName.isValid() {
            errorScreenNameLabel.isHidden = true
            screenName.createUser(self)
        } else {
            errorScreenNameLabel.isHidden = false
        }
    }
    
    func confirmEmail() {
        performSegue(withIdentifier: K.signupToConfrimEmailSegue, sender: self)
    }
    
}
