//
//  ProfileViewController.swift
//  Qlink
//
//  Created by Talha Jahangir on 4/15/22.
//

import UIKit
import Parse
import AlamofireImage

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var aboutMeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addBio: UITextView!
    @IBOutlet weak var addMajor: UITextField!
    @IBOutlet weak var addClassStanding: UITextField!
    

    @IBAction func onCancel(_ sender: Any) {
    dismiss(animated: true, completion: nil)
                
    }
    
   //---------
    @IBOutlet weak var imageView: UIImageView!
    
   
    @IBAction func onSave(_ sender: Any) {
        
      
       
        let user = PFObject(className: "Profile")
        user["bio"] = addBio.text!
        user["major"] = addMajor.text!
        user["classStanding"] = addClassStanding.text!
        user["author"] = PFUser.current()!
    let imageData = imageView.image!.pngData()
    let file = PFFileObject(name: "image.png", data: imageData!)
        user["image"] = file
        user.saveInBackground{
        (success, error) in
        if success {
            self.dismiss(animated: true, completion: nil)
            print("saved!")
        } else {
            print("error!")
        }
    }
        }
    
    @IBAction func onCamera2(_ sender: Any) {
    
    let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af_imageAspectScaled(toFill: size)
        imageView.image = scaledImage
        dismiss(animated: true, completion: nil)
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
           if ((notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
               if self.view.frame.origin.y != 0{
                   self.view.frame.origin.y += 100
               }}}
    //--------------
    
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
