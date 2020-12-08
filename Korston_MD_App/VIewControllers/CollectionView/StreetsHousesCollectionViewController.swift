//
//  StreetsHousesCollectionViewController.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 21.11.2020.
//

import UIKit


class StreetsHousesCollectionViewController: UICollectionViewController {
    //MARK: - Properties
    let reuseIdentifier = "HouseUICollectionViewCell"
    let databaseManager = DatabaseManager.shared
    var id = 0
    var housesArray: [House] = []
    var photosArray: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        housesArray = databaseManager.readHouses(id: id)
    }

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
