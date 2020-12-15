//
//  CountyStreetsTableViewController.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 07.12.2020.
//

import UIKit

class CountyStreetsTableViewController: UITableViewController {

    //MARK: - Properties
    var id = 0
    var databaseManager = DatabaseManager.shared
    var streetsArray: [Street] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        streetsArray = databaseManager.readStreets(id: id)
    }
}
