//
//  HousePhotosCollectionViewController.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 25.11.2020.
//

import UIKit

class HousePhotosCollectionViewController: UICollectionViewController {
    //MARK: - Outlets
    @IBOutlet weak var addButtonItem: UIBarButtonItem!
    
    //MARK: - Properties
    let refreshControl = UIRefreshControl()
    let reuseIdentifier = "HousePhotoCollectionViewCell"
    let auth = AuthManager.shared
    let storage = StorageManager.shared
    var districtId = ""
    var countyId = ""
    var streetId = ""
    var houseId = ""
    var photoPaths: [String] = []
    var imageFolderPath = ""
    
    var photosArray: [UIImage] = [] {
        didSet {
            
            if !(photosArray.count == photoPaths.count) {
                self.collectionView.reloadData()
                self.collectionView.collectionViewLayout.invalidateLayout()
                self.collectionView.layoutSubviews()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        print("ImageFolder: \(imageFolderPath)")
        if auth.isAuthorized {
            addButtonItem.isEnabled = true
        } else {
            addButtonItem.isEnabled = false
        }
        setupBarButtonItem()
        setupRefreshControl()
        downloadPhotos()
        
    }
}

