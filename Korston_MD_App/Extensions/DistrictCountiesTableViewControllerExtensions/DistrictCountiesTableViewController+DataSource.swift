//
//  DistrictCountiesTableViewController+DataSource.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 19.11.2020.
//

import UIKit

extension DistrictCountiesTableViewController {
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(districtName) р-н"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if countiesArray.count == 0 {
            self.tableView.setEmptyMessage("Нет данных")
        } else {
            self.tableView.restore()
        }
        return countiesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DistrictCountyCell", for: indexPath)
        let number = countiesArray[indexPath.row].name
        cell.textLabel?.text = "\(number)"
        return cell
    }
}
