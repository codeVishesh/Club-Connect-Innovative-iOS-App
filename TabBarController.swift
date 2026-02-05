////
////  TabBarController.swift
////  Club_Connect
////
////  Created by student on 11-04-2024.
////
//
//import UIKit
//
//class TabBarController: UITabBarController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.setupTabs()
//        self.tabBar.barTintColor = .systemRed
//        self.tabBar.tintColor = .systemYellow
//        self.tabBar.unselectedItemTintColor = .systemBlue
////
//        
//
//        // Do any additional setup after loading the view.
//    }
//    private func setupTabs(){
//        
////        self.cre
//        let home = self.createNav(title: "Home", image: UIImage(systemName: "home"), vc: HomeViewController())
//        let clubs = self.createNav(title: "Clubs", image: UIImage(systemName: "person.3"), vc: ClubsViewController())
//        let post = self.createNav(title: "Post", image: UIImage(systemName: "square.and.pencil"), vc: PostViewController())
//        let feed = self.createNav(title: "Feed", image: UIImage(systemName: "list.dash"), vc: FeedViewController())
//        let profile = self.createNav(title: "Profile", image: UIImage(systemName: "person"), vc: ProfileTableViewController())
//        
//        
//        
//        self.setViewControllers([home, clubs, post, feed, profile], animated: true)
//        selectedIndex = 4
//    }
//    private func createNav(title: String, image: UIImage?, vc: UIViewController) -> UINavigationController{
//        let nav = UINavigationController(rootViewController: vc)
//        nav.tabBarItem.title = title
//        nav.tabBarItem.image = image
//        
//        nav.viewControllers.first?.navigationItem.title = title  + "Controller"
//        return nav
//        
//        
//        
//    }
////    private func createNav1(title: String, image: UIImage?, vc: UITableViewController) -> UINavigationController{
////        let nav = UINavigationController(rootViewController: vc)
////        nav.tabBarItem.title = title
////        nav.tabBarItem.image = image
////        
////        nav.viewControllers.first?.navigationItem.title = title  + "Controller"
////        return nav
////        
////        
////        
////    }
////    
//
//    
//
//}
