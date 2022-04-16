//
//  UserProfileViewController.swift
//  Qlink
//
//  Created by Talha Jahangir on 4/14/22.
//

import UIKit
import Parse
import AlamofireImage


class UserProfileViewController: UIViewController {

    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var aboutMelabel: UILabel!
    
    @IBOutlet weak var aboutMeTextField: UITextView!
    
    @IBOutlet weak var majorLabel: UILabel!
    
    @IBOutlet weak var majorText: UITextView!
    
    
    @IBOutlet weak var academicYearLabel: UILabel!
    
    @IBOutlet weak var academicYearText: UITextView!
    
    @IBOutlet weak var interestLabel: UILabel!
    
    @IBOutlet weak var interestText: UITextView!
    
    
    @IBAction func onSignout(_ sender: Any) {
        
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let initialVC = main.instantiateViewController(withIdentifier: "InitialScreenNav")
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else {return}
        delegate.window?.rootViewController = initialVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
