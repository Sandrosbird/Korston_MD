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

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return streetsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountyStreetTableViewCell", for: indexPath)
        cell.textLabel?.text = streetsArray[indexPath.row].streetName

        return cell
    }
}
