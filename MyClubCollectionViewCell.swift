//
//  MyClubCollectionViewCell.swift
//  Club_Connect
//
//  Created by student on 01-05-2024.
//

import UIKit

class MyClubCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var clubImage: UIImageView!
    
    @IBOutlet weak var clubName: UILabel!
    
    override func awakeFromNib() {
            super.awakeFromNib()
            
            // Set the background color of the cell
            self.contentView.backgroundColor = UIColor.black.withAlphaComponent(0.7) // Replace lightGray with your desired color
        self.layer.cornerRadius = 15
        }
    
    func setUp(_ item: Club) {
        clubName.text = item.name
        clubImage.image = UIImage(named: item.clubLogo ?? "")
        clubImage.layer.cornerRadius = 10
        clubImage.clipsToBounds = true
        
    }
    
}
