////
////  EditProfileTableViewController.swift
////  Club_Connect
////
////  Created by Ansh Educational on 04/05/24.
////
//
import UIKit

protocol PassDataToVC: AnyObject {
    func passData(name: String, email: String, profilePicture: Data?)
}

class EditProfileTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Outlets
    @IBOutlet weak var editName: UITextField!
    //    @IBOutlet weak var editPhoneNumber: UITextField!
    @IBOutlet weak var editEmailId: UITextField!
    //    @IBOutlet weak var editDepartment: UITextField!
    @IBOutlet weak var editProfilePicture: UIImageView!
    
    var nameData = ""
    var emailData = ""
    var profilePictureData: Data?
    weak var delegate: PassDataToVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editName.text = nameData
        editEmailId.text = emailData
        editProfilePicture.image = UIImage(data: profilePictureData ?? Data())
        
        editProfilePicture.layer.cornerRadius = editProfilePicture.bounds.width / 2
        editProfilePicture.clipsToBounds = true
    }
        
        @IBAction func BtnImagePicker(_ sender: Any) {
            let picker = UIImagePickerController()
            picker.allowsEditing = true
            picker.delegate = self
            present(picker, animated: true)
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.editedImage] as? UIImage else { return }
            editProfilePicture.image = image
            profilePictureData = image.pngData()
            dismiss(animated: true)
        }
        
        //Save Button Action
        @IBAction func saveButton(_ sender: Any) {
//            if let name = editName.text, let email = editEmailId.text {
//                delegate?.passData(name: name, email: email, profilePicture: profilePictureData)
//            }
//            navigationController?.popViewController(animated: true)
            
            guard let name = editName.text, !name.isEmpty else {
                   showAlert(message: "Please enter your name.")
                   return
               }
               guard let email = editEmailId.text, !email.isEmpty else {
                   showAlert(message: "Please enter your email.")
                   return
               }
               delegate?.passData(name: name, email: email, profilePicture: profilePictureData)
               navigationController?.popViewController(animated: true)
        }
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func CancelOnTap(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
}
