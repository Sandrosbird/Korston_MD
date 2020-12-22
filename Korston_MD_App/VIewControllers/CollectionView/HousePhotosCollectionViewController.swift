//
//  HousePhotosCollectionViewController.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 25.11.2020.
//

import UIKit

class HousePhotosCollectionViewController: UICollectionViewController {
    
    //MARK: - Properties
    let reuseIdentifier = "HousePhotoCollectionViewCell"
    let storage = StorageManager.shared
    var districtId = ""
    var countyId = ""
    var streetId = ""
    var houseId = ""
    var photoPaths: [String] = []
    var imageFolderPath = ""
    
    var photosArray: [UIImage] = [] {
        didSet {
            self.collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(photoPaths)
        
        downloadPhotos()
        
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photosArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? HousePhotosCollectionViewCell else { return UICollectionViewCell() }
        
        cell.housePhoto?.image = photosArray[indexPath.row]
        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destination = storyboard.instantiateViewController(identifier: "DetailPhotoViewController") as? DetailPhotoViewController else { return }
        destination.image = self.photosArray[indexPath.row]
        show(destination, sender: nil)
    }
    
    //MARK: - Helpers
    
    func downloadPhotos() {
        self.storage.downloadPhotosPaths(path: self.imageFolderPath) { (paths) in
//            self.photoPaths = paths
            for path in paths {
                self.storage.downloadSinglePhoto(imagePath: path) { (image) in
                    self.photosArray.append(image)
                }
            }
        }
    }
}

