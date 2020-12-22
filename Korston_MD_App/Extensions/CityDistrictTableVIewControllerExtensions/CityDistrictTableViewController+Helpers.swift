//
//  CityDistrictTableViewController+Helpers.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 18.11.2020.
//

import UIKit

extension CityDistrictTableViewController {
    //MARK: - Helpers
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let district = districtsArray[indexPath.row]
        let id = district.id
        let name = district.name
        idTransfer(id: id, name: name)
        return indexPath
    }
    
    private func idTransfer(id: String, name: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destination = storyboard.instantiateViewController(identifier: "DistrictCountiesTableViewController") as? DistrictCountiesTableViewController else { return }
        destination.districtId = id
        destination.districtName = name
        show(destination, sender: nil)
    }
    
    func loadDistricts(completion: (() -> Void)? = nil) {
        FirestoreManager.shared.getDistricts() { [weak self] districts in
            DispatchQueue.main.async {
                self?.districtsArray = districts
                self?.tableView.reloadData()
            }
        }
    }
    
    func configureRefreshControl() {
        self.refreshControl?.attributedTitle = NSAttributedString(string: "Pull down to refresh")
        self.refreshControl?.addTarget(self, action: #selector(self.refreshTable(_:)), for: .valueChanged)
    }
    
    @objc func refreshTable(_ sender: Any?) {
        loadDistricts()
        refreshControl?.endRefreshing()
    }
}
