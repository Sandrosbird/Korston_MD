//
//  CountyStreetsCollectionViewController+DataSource.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 26.11.2020.
//

import UIKit

extension CountyStreetsCollectionViewController {
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return streetsArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StreetCollectionViewCell", for: indexPath) as? StreetCollectionViewCell else { return UICollectionViewCell() }
        cell.streetImage?.image = streetsArray[indexPath.row].image
        cell.streetName?.text = streetsArray[indexPath.row].name
        
        // Configure the cell
    
        return cell
    }
}
