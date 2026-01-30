import UIKit

class PostViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let firstSectionImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure collectionView
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        collectionView.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderView.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        
        // Configure firstSectionImageView
        firstSectionImageView.contentMode = .scaleAspectFit
        firstSectionImageView.clipsToBounds = true
        view.addSubview(firstSectionImageView)
        
        // Set up constraints
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        firstSectionImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // firstSectionImageView constraints
            firstSectionImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20), // Add top padding
            firstSectionImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20), // Add left padding
            firstSectionImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20), // Add right padding
            firstSectionImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5), // Half of the screen height
            
            // CollectionView constraints
            collectionView.topAnchor.constraint(equalTo: firstSectionImageView.bottomAnchor, constant: 20), // Add space between sections
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        // Set example image to firstSectionImageView
        if let exampleImage = UIImage(named: "feed1") {
            firstSectionImageView.image = exampleImage
        } else {
            print("Example image not found.")
        }
    }
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2 // Two sections: one for the first section image view and another for the collection view
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? 0 : 30 // Number of items in section 2 (collection view)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
        // Configure cell with photo for the collection view
        // You can use indexPath.row to determine the photo for this cell
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            // Update firstSectionImageView with the selected image from section 2
            if let selectedCell = collectionView.cellForItem(at: indexPath) as? PhotoCollectionViewCell {
                firstSectionImageView.image = selectedCell.imageView.image
                if let secondViewController = storyboard?.instantiateViewController(withIdentifier: "PostTableViewController") as? PostTableViewController {
                    secondViewController.selectedImage = selectedCell.imageView.image
                    navigationController?.pushViewController(secondViewController, animated: true)
                }
            }
        }}
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 5
        let collectionViewWidth = collectionView.frame.size.width
        let itemWidth = (collectionViewWidth - padding * 5) / 4 // 4 items per row with padding of 5 between them
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5 // Minimum line spacing between rows
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5 // Minimum interitem spacing between items in the same row
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader && indexPath.section == 1 {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderView.identifier, for: indexPath) as! SectionHeaderView
            headerView.titleLabel.text = "Recents"
            return headerView
        } else {
            // Handle other supplementary views
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return CGSize(width: collectionView.frame.width, height: 50) // Height of the section header
        } else {
            return CGSize.zero // No header for section 1
        }
    }
    
}

class SectionHeaderView: UICollectionReusableView {
    
    static let identifier = "SectionHeaderView"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
