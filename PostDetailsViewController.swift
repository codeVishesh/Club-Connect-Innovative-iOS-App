//
//  PostDetailsViewController.swift
//  Club_Connect
//
//  Created by student on 01-05-2024.
//

import UIKit

class PostDetailsViewController: UIViewController, UITableViewDataSource {
    
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = myData[indexPath.row]
        return cell
    }
    

   

}
