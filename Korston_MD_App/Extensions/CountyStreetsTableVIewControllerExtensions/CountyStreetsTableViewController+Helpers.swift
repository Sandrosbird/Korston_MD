//
//  CountyStreetsTableViewController+Helpers.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 07.12.2020.
//

import UIKit

extension CountyStreetsTableViewController {
    //MARK: - Helpers
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        //        let streets = countiesArray[indexPath.row]
        let streetId = streetsArray[indexPath.row].id
        idTransfer(streetId: streetId, districtId: districtId, countyId: countyId)
        return indexPath
    }
    
    private func idTransfer(streetId: String, districtId: String, countyId: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destination = storyboard.instantiateViewController(identifier: "StreetsHousesCollectionViewController") as? StreetsHousesCollectionViewController else { return }
        destination.streetId = streetId
        destination.countyId = countyId
        destination.districtId = districtId
        show(destination, sender: nil)
    }
    
    func loadStreets(completion: (() -> Void)? = nil) {
        FirestoreManager.shared.getStreetFor(districtId: districtId, countyId: countyId) { [weak self] streets in
            DispatchQueue.main.async {
                self?.streetsArray = streets
                self?.tableView.reloadData()
            }
        }
    }
    
    func configureRefreshControl() {
        self.refreshControl?.attributedTitle = NSAttributedString(string: "Pull down to refresh")
        self.refreshControl?.addTarget(self, action: #selector(self.refreshTable(_:)), for: .valueChanged)
    }
    
    @objc func refreshTable(_ sender: Any?) {
        loadStreets()
        refreshControl?.endRefreshing()
    }
}
