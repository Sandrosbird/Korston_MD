//
//  CityDistrictTableVIewController+DataSource.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 18.11.2020.
//

import UIKit

extension CityDistrictTableViewController {
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return districtsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityDistrictCell", for: indexPath)
        cell.textLabel?.text = districtsArray[indexPath.row].name
        return cell
    }
}
