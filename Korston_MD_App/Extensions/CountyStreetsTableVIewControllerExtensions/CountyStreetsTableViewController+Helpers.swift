//
//  CountyStreetsTableViewController+Helpers.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 07.12.2020.
//

import UIKit

extension CountyStreetsTableViewController {
    //MARK: - Helpers
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addStreet" {
            let destination = segue.destination as! NewStreetViewController
            destination.districtId = districtId
            destination.countyId = countyId
        }
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let street = streetsArray[indexPath.row]
        let streetId = street.id
        let streetName = street.name
        idTransfer(streetId: streetId, districtId: districtId, countyId: countyId, streetName: streetName, countyName: countyName, districtName: districtName)
        return indexPath
    }
    
    private func idTransfer(streetId: String, districtId: String, countyId: String, streetName: String, countyName: String, districtName: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destination = storyboard.instantiateViewController(identifier: "StreetsHousesCollectionViewController") as? StreetsHousesCollectionViewController else { return }
        destination.streetId = streetId
        destination.countyId = countyId
        destination.districtId = districtId
        destination.streetName = streetName
        destination.countyName = countyName
        destination.districtName = districtName
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
