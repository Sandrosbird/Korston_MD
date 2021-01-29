//
//  DistrictCountiesTableViewController.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 18.11.2020.
//

import UIKit

class DistrictCountiesTableViewController: UITableViewController {
    
    @IBOutlet weak var addbuttonItem: UIBarButtonItem!
    //MARK: - Properties
    var districtId = ""
    var countiesArray: [CountyFirebase] = []
    let auth = AuthManager.shared
    var districtName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        configureRefreshControl()
        
        if auth.isAuthorized {
            addbuttonItem.isEnabled = true
        } else {
            addbuttonItem.isEnabled = false
        }
        
        loadCounties()
        print(districtId)
    }
}
