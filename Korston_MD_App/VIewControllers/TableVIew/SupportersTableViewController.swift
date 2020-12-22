//
//  SupportersTableViewController.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 26.11.2020.
//

import UIKit

class SupportersTableViewController: UITableViewController {

    //MARK: - Properties
    var reuseIdentifier = "SupporterTableViewCell"
    var districtId = ""
    var countyId = ""
    var streetId = ""
    var houseId = ""
    var supportersArray: [SupporterFirebase] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

    
    //MARK: - Helpers
    func loadRoomers(completion: (() -> Void)? = nil) {
        FirestoreManager.shared.getRoomersFor(districtId: districtId, countyId: countyId, streetId: streetId, houseId: houseId) { [weak self] supporters in
            DispatchQueue.main.async {
                self?.supportersArray = supporters
                self?.tableView.reloadData()
            }
        }
    }

}
