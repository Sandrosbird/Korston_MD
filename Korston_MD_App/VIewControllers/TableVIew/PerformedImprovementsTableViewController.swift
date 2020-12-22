//
//  PerformedImprovementsTableViewController.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 27.11.2020.
//

import UIKit

class PerformedImprovementsTableViewController: UITableViewController {

    //MARK: - Properties
    var improvementsArray: [ImprovementFirebase] = []
    var districtId = ""
    var countyId = ""
    var streetId = ""
    var houseId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImprovements()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if improvementsArray.count == 0 {
            self.tableView.setEmptyMessage("Нет данных")
        } else {
            self.tableView.restore()
        }
        return improvementsArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PerformedImprovementTableViewCell", for: indexPath) as? PerformedImprovementTableViewCell else { return UITableViewCell() }
        cell.dateLabel.text = improvementsArray[indexPath.row].date
        cell.contractorLabel.text = improvementsArray[indexPath.row].contractor
        cell.improvementNameLabel.text = improvementsArray[indexPath.row].name
        
        return cell
    }
    
    //MARK: - Helpers
    func loadImprovements(completion: (() -> Void)? = nil) {
        FirestoreManager.shared.getJobsFor(districtId: districtId, countyId: countyId, streetId: streetId, houseId: houseId, type: .jobsDone) { [weak self] improvements in
            DispatchQueue.main.async {
                self?.improvementsArray = []
                self?.improvementsArray = improvements
                self?.tableView.reloadData()
            }
        }
    }


}
