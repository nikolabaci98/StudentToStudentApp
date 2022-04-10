//
//  LoginViewController.swift
//  Qlink
//
//  Created by Nikola Baci on 4/9/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailDomainTextField: UITextField!
    @IBOutlet weak var errorEmailOrPasswordTextField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailDomainTextField.text = K.emailDomain
        emailTextField.becomeFirstResponder()
    }
    
    @IBAction func onLoginPressed(_ sender: UIBarButtonItem) {
        errorEmailOrPasswordTextField.isHidden = true
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        let login = Login(email: email, password: password, self)
        login.userLogin()
    }
    
    func goToHome() {
        performSegue(withIdentifier: K.loginToTabVCSegue, sender: self)
    }
}
