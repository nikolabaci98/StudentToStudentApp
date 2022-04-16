//
//  GateViewController.swift
//  Qlink
//
//  Created by Nikola Baci on 4/7/22.
//

import UIKit

class GateViewController: UIViewController {

  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onSignupPressed(_ sender: UIButton) {
        performSegue(withIdentifier: K.SignupSegue, sender: self)
    }
    
    @IBAction func onLoginPressed(_ sender: UIButton) {
        performSegue(withIdentifier: K.LoginSegue, sender: self)
    }
}
