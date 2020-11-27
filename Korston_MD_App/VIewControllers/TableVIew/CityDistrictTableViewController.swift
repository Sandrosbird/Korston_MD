//
//  CityDistrictTableViewController.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 17.11.2020.
//

import UIKit

class CityDistrictTableViewController: UITableViewController {
    
    //MARK: - Properties
    var districtsArray: [District] = DistrictFactory.createDistricts()

    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
