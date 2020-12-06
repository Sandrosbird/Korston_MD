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
        let id = districtsArray[indexPath.row].id
        idTransfer(id: id)
        return indexPath
    }
    
    private func idTransfer(id: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destination = storyboard.instantiateViewController(identifier: "DistrictCountiesTableViewController") as? DistrictCountiesTableViewController else { return }
        destination.id = id
        show(destination, sender: nil)
    }
    
//    private func countiesTransfer(counties: [County]) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        guard let destination = storyboard.instantiateViewController(identifier: "DistrictCountiesTableViewController") as? DistrictCountiesTableViewController else { return }
//        destination.countiesArray = counties
//        show(destination, sender: nil)
//    }
}
