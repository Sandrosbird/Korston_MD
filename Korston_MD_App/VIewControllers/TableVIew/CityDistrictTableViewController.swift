//
//  CityDistrictTableViewController.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 17.11.2020.
//

import UIKit

class CityDistrictTableViewController: UITableViewController {
    @IBOutlet weak var addbuttonItem: UIBarButtonItem!
    @IBAction func addButtonDidTap(_ sender: Any) {
    }
    
    //MARK: - Properties
    let auth = AuthManager.shared
    let firestore = FirestoreManager.shared
    var districtsArray: [DistrictFirebase] = []

    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        configureRefreshControl()
        loadDistricts()
        if auth.isAuthorized {
            addbuttonItem.isEnabled = true
        } else {
            addbuttonItem.isEnabled = false
        }
    }
}
