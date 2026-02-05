////
////  ProfileTableViewController.swift
////  Club_Connect
////
////  Created by Ansh Educational on 04/05/24.
////
//
import UIKit

class ProfileTableViewController: UITableViewController {
    
    @IBOutlet weak var ProfilePicture: UIImageView!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Email: UILabel!
    
       var defaultUsername = UserDefaults.standard.string(forKey: "Username") ?? "Ansh Verma"
       var defaultEmail = UserDefaults.standard.string(forKey: "Email") ?? "ansh0216.be21@chitkara.edu.in"
       var defaultProfilePicture: Data? = UserDefaults.standard.data(forKey: "ProfilePicture")
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //default values initially
        Name.text = defaultUsername
        Email.text = defaultEmail
        if let defaultProfilePictureData = defaultProfilePicture {
                   ProfilePicture.image = UIImage(data: defaultProfilePictureData)
               } else {
                   ProfilePicture.image = UIImage(named: "face")
               }
               ProfilePicture.layer.cornerRadius = ProfilePicture.bounds.width / 2
               ProfilePicture.clipsToBounds = true
    }
    
    @IBAction func EditProfileTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "EditProfileTableViewController") as? EditProfileTableViewController
               vc?.nameData = Name.text!
               vc?.emailData = Email.text!
               vc?.delegate = self
               vc?.profilePictureData = defaultProfilePicture //default profile picture data
               vc?.delegate = self
               navigationController?.pushViewController(vc!, animated: true)
    }
}

extension ProfileTableViewController: PassDataToVC {
    func passData(name: String, email: String, profilePicture: Data?) {
               //default values
               defaultUsername = name
               defaultEmail = email
               defaultProfilePicture = profilePicture
               
               //updated values to UserDefaults
               UserDefaults.standard.set(name, forKey: "Username")
               UserDefaults.standard.set(email, forKey: "Email")
               UserDefaults.standard.set(profilePicture, forKey: "ProfilePicture")
               
               Name.text = name
               Email.text = email
               if let profilePicData = profilePicture {
                   ProfilePicture.image = UIImage(data: profilePicData)
               } else {
                   ProfilePicture.image = UIImage(named: "face")
               }
              ProfilePicture.layer.cornerRadius = ProfilePicture.bounds.width / 2
              ProfilePicture.clipsToBounds = true
    }
}
