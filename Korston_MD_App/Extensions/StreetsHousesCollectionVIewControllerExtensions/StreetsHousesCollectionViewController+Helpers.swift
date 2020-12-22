//
//  StreetsHousesCollectionViewController+Helpers.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 26.11.2020.
//

import UIKit

extension StreetsHousesCollectionViewController {
    //MARK: - Helpers
    func loadHouses(completion: (() -> Void)? = nil) {
        DispatchQueue.global().async {
            FirestoreManager.shared.getHousesFor(districtId: self.districtId, countyId: self.countyId, streetId: self.streetId) { [weak self] houses in
                DispatchQueue.main.async {
                    self?.housesArray = houses
                    self?.collectionView.reloadData()
                }
            }
        }
    }
    
//    func loadPhoto(imagePath: String) -> UIImage {
//        var image: UIImage
//        
//        return image
//    }

    
//    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let id = housesArray[indexPath.row].id
//        idTransfer(id: id)
//    }
//    
//    private func idTransfer(id: Int) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        guard let destination = storyboard.instantiateViewController(identifier: "HousePhotosCollectionViewController") as? HousePhotosCollectionViewController else { return }
//        destination.id = id
//        show(destination, sender: nil)
//    }
}
