//
//  SupportersTableViewController.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 26.11.2020.
//

import UIKit

class SupportersTableViewController: UITableViewController {
    //MARK: - Outlets
    @IBOutlet weak var addButtonItem: UIBarButtonItem!
    
    //MARK: - Properties
    let auth = AuthManager.shared
    var reuseIdentifier = "SupporterTableViewCell"
    var districtId = ""
    var countyId = ""
    var streetId = ""
    var houseId = ""
    var supportersArray: [SupporterFirebase] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if auth.isAuthorized {
            addButtonItem.isEnabled = true
        } else {
            addButtonItem.isEnabled = false
        }
        configureRefreshControl()
        loadRoomers()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if supportersArray.count == 0 {
            self.tableView.setEmptyMessage("Нет данных")
        } else {
            self.tableView.restore()
        }
        return supportersArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? SupporterTableViewCell else { return UITableViewCell() }
        let supporter = supportersArray[indexPath.row]

        cell.nameLabel.text = supporter.name
        cell.apartmentLabel.text = "кв.\(supporter.apartment)"
        cell.phoneLabel.text = "тел. \(supporter.phone)"
        cell.emailLabel.text = "e-mail: \(supporter.email)"
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSupporter" {
            let destination = segue.destination as! NewSupporterViewController
            destination.districtId = districtId
            destination.countyId = countyId
            destination.streetId = streetId
            destination.houseId = houseId
        }
    }

    
    //MARK: - Helpers
    func loadRoomers(completion: (() -> Void)? = nil) {
        FirestoreManager.shared.getRoomersFor(districtId: districtId, countyId: countyId, streetId: streetId, houseId: houseId) { [weak self] supporters in
            DispatchQueue.main.async {
                self?.supportersArray = supporters
                self?.tableView.reloadData()
            }
        }
    }
    
    func configureRefreshControl() {
        self.refreshControl?.attributedTitle = NSAttributedString(string: "Pull down to refresh")
        self.refreshControl?.addTarget(self, action: #selector(self.refreshTable(_:)), for: .valueChanged)
    }
    
    @objc func refreshTable(_ sender: Any?) {
        loadRoomers()
        refreshControl?.endRefreshing()
    }

}
