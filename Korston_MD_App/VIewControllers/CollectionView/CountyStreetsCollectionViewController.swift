//
//  CountyStreetsCollectionViewController.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 19.11.2020.
//

import UIKit



class CountyStreetsCollectionViewController: UICollectionViewController {
    
    //MARK: - Properties
    private let reuseIdentifier = "StreetCollectionViewCell"
    var streetsArray: [Street] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: UICollectionViewDelegate

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


}
