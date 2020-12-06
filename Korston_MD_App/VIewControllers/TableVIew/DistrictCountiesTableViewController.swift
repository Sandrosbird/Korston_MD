//
//  DistrictCountiesTableViewController.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 18.11.2020.
//

import UIKit

class DistrictCountiesTableViewController: UITableViewController {
    
    //MARK: - Properties
    var id = 0
    var databaseManager = DatabaseManager.shared
    var countiesArray: [County] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        countiesArray = databaseManager.readCounties(id: id)
        print(id)
    }
}
