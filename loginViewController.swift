////
////  loginViewController.swift
////  Club_Connect
////
////  Created by student on 13-04-2024.
////
//
//import UIKit
//
//class loginViewController: UIViewController {
//
//    
//    
//    
////    @IBOutlet weak var emailTextField: UIText/*  @IBOutlet weak var passwordTextField: UITextField!*/
//    
//    
//    @IBOutlet weak var emailtext: UITextField!
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        
//    }
//        
//        
//        
//    
//        
//        
//    @IBAction func login(_ sender: UIButton) {
//        
//        if let email = emailtext.text{
//            performSegue(withIdentifier: "ShowProfile", sender: email)
//            print(email)
//        }
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if segue.identifier == "ShowProfile", let email = sender as? String {
//                if let profilevc = segue.destination as? ProfileTableViewController {
//                    profilevc.loginEmail = email // Assign email to loginEmail property in ProfileTableViewController
//                }
//            }
//        }
//    
//    
//   
//
//}
