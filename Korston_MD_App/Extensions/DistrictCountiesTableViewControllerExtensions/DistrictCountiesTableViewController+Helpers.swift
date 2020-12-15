//
//  DistrictCountiesTableViewController+Helpers.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 19.11.2020.
//

import UIKit

extension DistrictCountiesTableViewController {
    //MARK: - Helpers
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
//        let streets = countiesArray[indexPath.row]
        let id = countiesArray[indexPath.row].id
        idTransfer(id: id)
        return indexPath
    }
    
    private func idTransfer(id: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destination = storyboard.instantiateViewController(identifier: "CountyStreetsTableViewController") as? CountyStreetsTableViewController else { return }
        destination.id = id
        show(destination, sender: nil)
    }
}
