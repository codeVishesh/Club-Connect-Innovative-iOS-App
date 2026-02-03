//
//  RecClubsCollectionViewCell.swift
//  Club_Connect
//
//  Created by student on 01-05-2024.
//

import UIKit

class RecClubsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ClubImage: UIImageView!
    
    func setUp(_ item: Club){
        ClubImage.image = UIImage(named: item.clubImage ?? "")
        ClubImage.layer.cornerRadius = 20
    }
}
