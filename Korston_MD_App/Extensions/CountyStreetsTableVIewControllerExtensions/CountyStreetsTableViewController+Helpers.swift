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
        let id = streetsArray[indexPath.row].id
        idTransfer(id: id)
        return indexPath
    }
    
    private func idTransfer(id: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destination = storyboard.instantiateViewController(identifier: "StreetsHousesCollectionViewController") as? StreetsHousesCollectionViewController else { return }
        destination.id = id
        show(destination, sender: nil)
    }
}
