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
    let databaseManager = DatabaseManager.shared
    var id = 0
    
    var photosArray: [UIImage] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.global().async {
            self.photosArray = self.databaseManager.readHousePhotos(id: self.id)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
    }

    // MARK: - Navigation
    
    

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
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destination = storyboard.instantiateViewController(identifier: "DetailPhotoViewController") as? DetailPhotoViewController else { return }
        destination.image = self.photosArray[indexPath.row]
        show(destination, sender: nil)
    }
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
