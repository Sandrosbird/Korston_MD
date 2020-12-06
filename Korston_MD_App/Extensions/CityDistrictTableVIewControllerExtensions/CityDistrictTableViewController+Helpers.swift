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
        let counties = districtsArray[indexPath.row].counties
        countiesTransfer(counties: counties)
        return indexPath
    }
    
    private func countiesTransfer(counties: [County]) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destination = storyboard.instantiateViewController(identifier: "DistrictCountiesTableViewController") as? DistrictCountiesTableViewController else { return }
        destination.countiesArray = counties
        show(destination, sender: nil)
    }
}
