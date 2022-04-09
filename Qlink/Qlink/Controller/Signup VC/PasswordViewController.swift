//
//  PasswordViewController.swift
//  Qlink
//
//  Created by Nikola Baci on 4/7/22.
//

import UIKit

class PasswordViewController: UIViewController {

    var email: String!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorPasswordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        passwordTextField.becomeFirstResponder()
    }
    
    @IBAction func onNextPressed(_ sender: UIBarButtonItem) {
        let password = Password(password: passwordTextField.text!)
        
        if password.isValid() {
            errorPasswordLabel.isHidden = true
            performSegue(withIdentifier: K.passwordToScreenNameSegue, sender: self)
        } else {
            errorPasswordLabel.isHidden = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.passwordToScreenNameSegue {
            let usernameVC = segue.destination as! ScreenNameViewController
            usernameVC.email = self.email
            usernameVC.password = self.passwordTextField.text!
        }
    }
    

}
