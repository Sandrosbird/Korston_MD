//
//  StreetsHousesCollectionViewController.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 21.11.2020.
//

import UIKit


class StreetsHousesCollectionViewController: UICollectionViewController {
    @IBOutlet weak var addbuttonItem: UIBarButtonItem!
    //MARK: - Properties
    let refreshControl = UIRefreshControl()
    let reuseIdentifier = "HouseUICollectionViewCell"
    let storage = StorageManager.shared
    var streetId = ""
    var districtId = ""
    var countyId = ""
    var streetName = ""
    var countyName = ""
    var districtName = ""
    var housesArray: [HouseFirebase] = []
    let auth = AuthManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRefreshControl()
        if auth.isAuthorized {
            addbuttonItem.isEnabled = true
        } else {
            addbuttonItem.isEnabled = false
        }
        loadHouses()
    }
}
