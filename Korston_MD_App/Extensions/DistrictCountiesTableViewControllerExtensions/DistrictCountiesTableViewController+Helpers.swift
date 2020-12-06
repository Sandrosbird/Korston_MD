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
        let streets = countiesArray[indexPath.row]
//        streetsTransfer(streets: streets)
        return indexPath
    }
    
    private func streetsTransfer(streets: [Street]) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destination = storyboard.instantiateViewController(identifier: "CountyStreetsCollectionViewController") as? CountyStreetsCollectionViewController else { return }
        destination.streetsArray = streets
        show(destination, sender: nil)
    }
}
