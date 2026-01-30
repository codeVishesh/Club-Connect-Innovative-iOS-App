//
//  SecondViewController.swift
//  Club_Connect
//
//  Created by student on 02-05-2024.
//

import UIKit

class SecondViewController: UIViewController {
    var selectedImage: UIImage?
    @IBOutlet weak var imagev: UIImageView!
//var selectedImage: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
                if let image = selectedImage {
                    imagev.image = image
                }
            }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


