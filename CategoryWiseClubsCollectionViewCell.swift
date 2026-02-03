//
//  CategoryWiseClubsCollectionViewCell.swift
//  Club_Connect
//
//  Created by student on 04-05-2024.
//

import UIKit

class CategoryWiseClubsCollectionViewCell: UICollectionViewCell {
    var item: Club?
    @IBOutlet weak var clubName: UILabel!
    @IBOutlet weak var clubImage: UIImageView!
    
    @IBOutlet weak var joinButton: UIButton!
    func setUp(_ item: Club){
        self.item = item
//        clubName.text = item.categoryName
        clubName.text = item.name
        clubImage.image = UIImage(named: item.clubLogo ?? "repo")
        clubImage.layer.cornerRadius = 20
        self.layer.cornerRadius = 15
        if item.joined == true {
//            joinButton.titleLabel?.text = "Joined"
//            joinButton.backgroundColor = .systemGray4
            //joinButton.tintColor = .systemGray4
            joinButton.setTitle("Joined", for: .normal)
            joinButton.setTitleColor(.systemGray4, for: .normal)
        }
        else if item.processing == true {
            joinButton.setTitle("Processing", for: .normal)
            joinButton.setTitleColor(.systemGray4, for: .normal)
        }
        else{
            joinButton.setTitle("Join", for: .normal)
//            joinButton.titleLabel?.text = "Join"
            joinButton.setTitleColor(.blue, for: .normal)
        }
    }
    
    @IBAction func onClick(_ sender: Any) {
     //   club.joinClub(clubName: item?.name ?? "jjd")
        if let item = self.item {
            if item.joined == false && item.processing == false {
                let alertController = UIAlertController(title: "Request Sent", message: "Your request to join the club has been sent successfully.", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAction)
                
                if  let viewController = self.window?.rootViewController{
                    viewController.present(alertController, animated: true, completion: nil)
                }
                
                joinButton.setTitle("Processing", for: .normal)
                club.updateChanges(item: item.name)
                joinButton.setTitleColor(.systemGray4, for: .normal)
//                joinButton.tintColor = .systemGray4
                
                //        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                //               // Reset the button state after the processing is completed
                //               self.joinButton.isEnabled = false
                //               self.joinButton.setTitle("Processing", for: .normal)
                //               self.joinButton.tintColor = .systemGray4
                //               self.item?.joined = true
                //           }
            }
        }
        
    }
    
    
}
