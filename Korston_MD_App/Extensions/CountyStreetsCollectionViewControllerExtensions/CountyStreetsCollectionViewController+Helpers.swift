//
//  CountyStreetsCollectionViewController+Helpers.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 26.11.2020.
//

import UIKit

extension CountyStreetsCollectionViewController {
    //MARK: - Helpers
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let houses = streetsArray[indexPath.row].houses
        housesTransfer(houses: houses)
    }
    
    private func housesTransfer(houses: [House]) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destination = storyboard.instantiateViewController(identifier: "StreetsHousesCollectionViewController") as? StreetsHousesCollectionViewController else { return }
        destination.housesArray = houses
        show(destination, sender: nil)
    }
}
