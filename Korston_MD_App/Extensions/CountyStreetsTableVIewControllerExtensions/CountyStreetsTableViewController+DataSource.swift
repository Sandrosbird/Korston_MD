//
//  CountyStreetsTableViewController+DataSource.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 07.12.2020.
//

import UIKit

extension CountyStreetsTableViewController {
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(districtName) р-н, окр. №\(countyName)"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if streetsArray.count == 0 {
            self.tableView.setEmptyMessage("Нет данных")
        } else {
            self.tableView.restore()
        }
        return streetsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountyStreetTableViewCell", for: indexPath)
        let streetName = streetsArray[indexPath.row].name
        cell.textLabel?.text = "ул. \(streetName)"

        return cell
    }
}
