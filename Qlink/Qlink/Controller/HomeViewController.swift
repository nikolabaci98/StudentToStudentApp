//
//  HomeViewController.swift
//  Qlink
//
//  Created by Nikola Baci on 4/9/22.
//

import UIKit
import Parse

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onSignoutPressed(_ sender: UIButton) {
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let initialVC = main.instantiateViewController(withIdentifier: "InitialScreenNav")
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else {return}
        delegate.window?.rootViewController = initialVC
    }
    
}
