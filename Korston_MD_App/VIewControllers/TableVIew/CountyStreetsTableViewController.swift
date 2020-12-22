//
//  CountyStreetsTableViewController.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 07.12.2020.
//

import UIKit

class CountyStreetsTableViewController: UITableViewController {

    @IBOutlet weak var addbuttonItem: UIBarButtonItem!
    //MARK: - Properties
    var districtId = ""
    var countyId = ""
    var districtName = ""
    var countyName = ""
    var streetsArray: [StreetFirebase] = []
    let auth = AuthManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureRefreshControl()
        if auth.isAuthorized {
            addbuttonItem.isEnabled = true
        } else {
            addbuttonItem.isEnabled = false
        }
        loadStreets()
    }
}
