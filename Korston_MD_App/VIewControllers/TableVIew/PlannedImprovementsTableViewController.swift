//
//  PlannedImprovementsTableViewController.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 27.11.2020.
//

import UIKit

class PlannedImprovementsTableViewController: UITableViewController {

    //MARK: - Properties
    var districtId = ""
    var countyId = ""
    var streetId = ""
    var houseId = ""
    var improvementsArray: [ImprovementFirebase] = []
    
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlannedImprovementTableVIewCell", for: indexPath) as? PlannedImprovementTableVIewCell else { return UITableViewCell() }
        
        cell.dateLabel.text = improvementsArray[indexPath.row].date
        cell.contractorNameLabel.text = improvementsArray[indexPath.row].contractor
        cell.improvementNameLabel.text = improvementsArray[indexPath.row].name
        
        return cell
    }
    
    //MARK: - Helpers
    func loadImprovements(completion: (() -> Void)? = nil) {
        FirestoreManager.shared.getJobsFor(districtId: districtId, countyId: countyId, streetId: streetId, houseId: houseId, type: .plannedJobs) { [weak self] improvements in
            DispatchQueue.main.async {
                self?.improvementsArray = improvements
                self?.tableView.reloadData()
            }
        }
    }
}
