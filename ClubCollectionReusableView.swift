//
//  ClubCollectionReusableView.swift
//  Club_Connect
//
//  Created by student on 30-04-2024.
//

import UIKit

class ClubCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var cellTitlelbl: UILabel!
    
    func setup(_ title: String) {
        cellTitlelbl.text = title
//        let attributes: [NSAttributedString.key: Any] = [
//            .font:
//        ]
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 20),  // Adjust font size and style
        ]
        let attributedTitle = NSAttributedString(string: title, attributes: attributes)
        cellTitlelbl.attributedText = attributedTitle
    }
}
