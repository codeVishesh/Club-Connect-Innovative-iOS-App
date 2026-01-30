////////
////////  PhotoCollectionViewCell.swift
////////  PostClubConnect
////////
////////  Created by student on 22-04-2024.
//////import UIKit

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    static let identifier = "PhotoCollectionViewCell"
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        
        // Set isUserInteractionEnabled here
        imageView.isUserInteractionEnabled = true
        
        let images: [UIImage] = [
            UIImage(named: "feed2"),
            UIImage(named: "feed3"),
            UIImage(named: "feed4"),
            UIImage(named: "feed5"),
            UIImage(named: "feed6"),
            UIImage(named: "feed7"),
            UIImage(named: "feed9"),
            UIImage(named: "feed10"),
            UIImage(named: "feed11"),
//            UIImage(named: "c2s2"),
//            UIImage(named: "image3"),
//            UIImage(named: "image4"),
//            UIImage(named: "image1"),
//            UIImage(named: "image2"),
//            UIImage(named: "image3"),
//            UIImage(named: "image4")
            
        ].compactMap { $0 }
        
        imageView.image = images.randomElement()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
        // Custom layout code here
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
//        imageView.image = nil // Reset the image to clear previous content
    }
}
