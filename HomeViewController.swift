//
//  HomeViewController.swift
//  Club_Connect
//
//  Created by student on 11-04-2024.
//
import UIKit

class HomeViewController: UIViewController {
   
    
    @IBOutlet weak var scannerButton: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    
//    var imgArray = ["image32", "Spo","Bad"]
    
    var imgArray = MockData.shared.fetchImageRec()
    
    
    
   
    
    var timer: Timer?
    private let sections = MockData.shared.pageData
    var currentIndex = 0
    var index = 0
   
    private let searchViewController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        return controller
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = searchViewController
        navigationItem.hidesSearchBarWhenScrolling = true
        print(sections.count)
//        view.addSubview(searchViewController)
        
//        if let navigationBar = self.navigationController?.navigationBar {
//            let firstFrame = CGRect(x: 120, y: 26, width: navigationBar.frame.width/2, height: navigationBar.frame.height)
//            let firstLabel = UILabel(frame: firstFrame)
//            firstLabel.text = getCurrentDate()
//            firstLabel.textColor = .gray
//            firstLabel.font = UIFont.boldSystemFont(ofSize: 17)
//           
//            navigationBar.addSubview(firstLabel)
//        }
        
//     startAutomaticScroll()
//        setUpTopNavbar()
        
       
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(scrollinsetUp), userInfo: nil, repeats: true)
        
        
        collectionView.collectionViewLayout = createLayout()
        
        
       

    }
    
    @objc func scrollinsetUp(){
        print(imgArray.count)
        if index < imgArray.count-1{
            index = index + 1
        }
        else{
            index = 0
        }
        collectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .right, animated: true)
    }
    
    
    private func startAutomaticScroll() {
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(scrollToNextItem), userInfo: nil, repeats: true)
    }

    private func stopAutomaticScroll() {
        timer?.invalidate()
        timer = nil
    }
//
    @objc private func scrollToNextItem() {
        // Assuming there's only one section for simplicity
        let sectionIndex = 0
        let currentSection = sections[sectionIndex]
        
        
        
        // Only scroll if the current section is .recommended
        guard case .recommended = currentSection else {
            // If the current section is not .recommended, return without scrolling
            return
        }
        
        let itemCount = currentSection.count
        currentIndex = (currentIndex + 1) % itemCount
        let indexPath = IndexPath(item: currentIndex, section: sectionIndex)
        
        let offsetX = CGFloat(currentIndex) * collectionView.bounds.width
        
        UIView.animate(withDuration: 2.9, delay: 0.1, options: .curveLinear, animations: {
            self.collectionView.contentOffset.x = offsetX
        }, completion: nil)
    }
//
//
//
//
    
    
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let layout =  UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
            guard let self = self else { return nil }
            let section = self.sections[sectionIndex]
            switch section {
            case .recommended:
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.3)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 15
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                section.supplementariesFollowContentInsets = false
//                startAutomaticScroll()
                return section
            case .eventsThisWeek:
//            case .eventsThisWeek:
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.2)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
               // section.orthogonalScrollingBehavior = .continuous // Disable continuous scrolling
                section.interGroupSpacing = 20
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                section.supplementariesFollowContentInsets = false
                return section

            case .recClubs:
                
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.25)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 5
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                section.supplementariesFollowContentInsets = false
//                startAutomaticScroll()
                return section
               
             
            }
        }
//        layout.configuration.sectionHeaderTopPadding = 20
        layout.configuration.interSectionSpacing = 200
        
        return layout
    }

    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let supplementaryItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        supplementaryItem.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0)
        return supplementaryItem
       
    }
    
    @objc func scannerButtonTapped() {
        
    }
    
    func getCurrentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM"
        return formatter.string(from: Date())
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch sections[section] {
            case .recommended(let items):
                return items.count
            case .eventsThisWeek(let items):
                return items.count
        case .recClubs(let items):
            return items.count
//
            }    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
        
        case .eventsThisWeek(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PortaitModeCollectionViewCell", for: indexPath) as! PortaitModeCollectionViewCell
            cell.setup(items[indexPath.row])
//            header
            return cell
            
        case .recommended(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LandscapeCollectionViewCell", for: indexPath) as! LandscapeCollectionViewCell
            cell.setup(items[indexPath.row])
            return cell

        case .recClubs(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClubRecCollectionViewCell", for: indexPath) as! ClubRecCollectionViewCell
            cell.setup(items[indexPath.row])
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionViewReusableView", for: indexPath) as? CollectionViewReusableView else{
            fatalError("Unexpected supplementary view kind: \(kind)")
        }
        
                var isButtonHiden: Bool
                
                switch sections[indexPath.section]{
                    
                case .recommended:
                    isButtonHiden = true
                case .eventsThisWeek:
                    isButtonHiden = false
//                case .recomClubs:
//                    isButtonHiden = true
                case .recClubs:
                    isButtonHiden = true
                }
                
                
                
                
        //        switch kind {
        //        case UICollectionView.elementKindSectionHeader:
        //            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionViewReusableView", for: indexPath) as! CollectionViewReusableViewle,
        header.setup(sections[indexPath.section].title, isButtonHidden: isButtonHiden)
                  return header

          //  return header
        //        default:
        //            fatalError("Unexpected supplementary view kind: \(kind)")
//        }
    }

    
}


class EventThisWeekCell: UICollectionViewCell{
    
    @IBOutlet weak var EventImage: UIImageView!
    
    @IBOutlet weak var EventDate: UILabel!
//    let dateFormatter = DateFormatter()
//       dateFormatter.dateFormat = "MMM dd, yyyy"
    @IBOutlet weak var EventName: UILabel!
    
    @IBOutlet weak var ClubName: UILabel!
    
    
//    func setUp(image: UIImage, eventDate: String,eventName: String, clubName: String
//    ){
//        EventImage.image = image
//        EventDate.text = eventDate
//        ClubName.text = clubName
//        EventName.text = eventName
//    }
    
}
