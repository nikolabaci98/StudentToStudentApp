//
//  ViewController.swift
//  Qlink
//
//  Created by Nikola Baci on 4/4/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var errorEmailLabel: UILabel!
    @IBOutlet weak var emailDomainTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailDomainTextField.text = K.emailDomain
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        emailTextField.becomeFirstResponder()
    }
    
    //when next is pressed, validate email and
    //then preform segue to password screen
    @IBAction func onNextPressed(_ sender: UIBarButtonItem) {
        let email = Email(email: emailTextField.text!)
        
        if email.isValid() {
            errorEmailLabel.isHidden = true
            performSegue(withIdentifier: K.emailToPasswordSegue, sender: self)
        } else {
            errorEmailLabel.isHidden = false
        }
    }
    
    //pass the email to the next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.emailToPasswordSegue {
            let passwordVC = segue.destination as! PasswordViewController
            passwordVC.email = emailTextField.text!
        }
    }
    
}

