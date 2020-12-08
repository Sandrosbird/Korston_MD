//
//  CityDistrictTableViewController.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 17.11.2020.
//

import UIKit
import FMDB

class CityDistrictTableViewController: UITableViewController {
    
    //MARK: - Properties
    let databaseManager = DatabaseManager.shared
    var districtsArray: [District] = []

    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        districtsArray = databaseManager.readDistricts()
    }
}
