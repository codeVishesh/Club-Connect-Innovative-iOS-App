//
//  PostTableViewController.swift
//  Club_Connect
//
//  Created by student on 02-05-2024.
//

import UIKit
protocol
PostViewControllerDelegate{
    func updateProperty(newValue: FeedList?)
}
class PostTableViewController: UITableViewController {
    
    var selectedItem: FeedList?
    var delegate: PostViewControllerDelegate?
    
    @IBOutlet weak var eventImage: UIImageView!
    
    @IBOutlet weak var clubpost: UITextField!
    var selectedImage: UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let selectedItem = selectedItem{
            if let image = UIImage(named: selectedItem.imageURL){
                eventImage.image = image
            }
        }
        if let selectedImage {
            eventImage.image = selectedImage
            
            
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitButton(_ sender: Any) {
        //performSegue(withIdentifier: "SubmitSegue", sender: nil)
     
        
        
        
        
        
        let alertController = UIAlertController(title: "Alert", message: "Switching to SecondVC", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                    // Dismiss alert
                    alertController.dismiss(animated: true, completion: nil)
                    
                    // Switch to SecondVC
                    
                       if let tabBarController = self.tabBarController {
                           // Specify the index of the tab you want to switch to
                           tabBarController.selectedIndex = 3
                       }
                    
                    // Access SecondVC and pass data
                    if let tabBarVC = self.tabBarController,
                       let feedVCNav = tabBarVC.viewControllers?[3] as? UINavigationController,
                       let feedVC = feedVCNav.viewControllers.first as? FeedTableViewController {
                        feedVC.selectedImage = self.selectedImage// .receivedData = self.dataToPass
                    }
                }))
                present(alertController, animated: true, completion: nil)
        
        
        
        
        
        
        
//        dismiss(animated: true){
//            if let appDelegate = UIApplication.shared.delegate as? AppDelegate,
//               let window = appDelegate.window,
//               let rootViewController = window.rootViewController
//        }
        
//        dismiss(animated: true){
//            if let appdelegate = UIApplication.shared.delegate
//        }
//        if let feedVC = storyboard?.instantiateViewController(withIdentifier: "FeedTableViewController") as? FeedTableViewController {
//            self.delegate = feedVC
//            feedVC.selectedItem = selectedItem
//            
//            
//            
//            self.showAlert(title: "Are you sure!", message: "Post Successfully")
//            let eventData = FeedList(title: "New Event Title", description: "New Event Description", date: Date(), category: "New Category", imageURL: "String", clubName: "New Club Name", imageName: "New Image Name")
//            EventsThisWeek.shared.addfeeds(feed: eventData)
//            
//        }
    }
    
    
    
    func showAlert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        delegate?.updateProperty(newValue: selectedItem)
        if let viewController = UIApplication.shared.windows.first?.rootViewController {
            
            viewController.present(alertController, animated: true)
        }
    }
    
    
}
