//
//  DistrictCountiesTableViewController+Helpers.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 19.11.2020.
//

import UIKit

extension DistrictCountiesTableViewController {
    //MARK: - Helpers
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addCounty" {
            let destination = segue.destination as! NewCountyViewController
            destination.districtId = districtId
        }
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let county = countiesArray[indexPath.row]
        let id = county.id
        let name = county.name
        idTransfer(countyName: name,countyId: id, districtId: districtId, districtName: districtName)
        return indexPath
    }
    
    private func idTransfer(countyName: String, countyId: String, districtId: String, districtName: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destination = storyboard.instantiateViewController(identifier: "CountyStreetsTableViewController") as? CountyStreetsTableViewController else { return }
        destination.countyId = countyId
        destination.districtId = districtId
        destination.countyName = countyName
        destination.districtName = districtName
        show(destination, sender: nil)
    }
    
    func loadCounties(completion: (() -> Void)? = nil) {
        FirestoreManager.shared.getCounties(for: districtId) { [weak self] counties in
            DispatchQueue.main.async {
                self?.countiesArray = counties
                self?.tableView.reloadData()
            }
        }
    }
    
    func configureRefreshControl() {
        self.refreshControl?.attributedTitle = NSAttributedString(string: "Pull down to refresh")
        self.refreshControl?.addTarget(self, action: #selector(self.refreshTable(_:)), for: .valueChanged)
    }
    
    @objc func refreshTable(_ sender: Any?) {
        loadCounties()
        refreshControl?.endRefreshing()
    }
}
