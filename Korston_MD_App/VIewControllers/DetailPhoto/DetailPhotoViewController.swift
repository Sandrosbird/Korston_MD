//
//  DetailPhotoViewController.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 08.12.2020.
//

import UIKit

class DetailPhotoViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var houseImage: UIImageView!
    var image: UIImage = UIImage(named: "nodata")!
    
    //MARK: - Properties
    override func viewDidLoad() {
        super.viewDidLoad()
        self.houseImage.image = image
    }
    
}
