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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addHouse" {
            let destination = segue.destination as! NewHouseViewController
            destination.districtId = districtId
            destination.countyId = countyId
            destination.streetId = streetId
        }
    }
    
    func setupRefreshControl() {
        collectionView.refreshControl = refreshControl
        refreshControl.attributedTitle = NSAttributedString(string: "Pull down to refresh...")
        refreshControl.addTarget(self, action: #selector(refreshCollection(_:)), for: .valueChanged)
    }
    
    @objc func refreshCollection(_ sender: Any) {
        housesArray = []
        loadHouses()
        self.collectionView.reloadData()
        refreshControl.endRefreshing()
    }
}
