//
//  PerformedImprovementsTableViewController.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 27.11.2020.
//

import UIKit

class PerformedImprovementsTableViewController: UITableViewController {
    //MARK: - Outlets
    @IBOutlet weak var addButtonItem: UIBarButtonItem!
    
    //MARK: - Properties
    let auth = AuthManager.shared
    var improvementsArray: [ImprovementFirebase] = []
    var districtId = ""
    var countyId = ""
    var streetId = ""
    var houseId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if auth.isAuthorized {
            addButtonItem.isEnabled = true
        } else {
            addButtonItem.isEnabled = false
        }
        configureRefreshControl()
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addPerformedImprovement" {
            let destination = segue.destination as! NewPerformedImprovementViewController
            destination.districtId = districtId
            destination.countyId = countyId
            destination.streetId = streetId
            destination.houseId = houseId
        }
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
    
    func configureRefreshControl() {
        self.refreshControl?.attributedTitle = NSAttributedString(string: "Pull down to refresh")
        self.refreshControl?.addTarget(self, action: #selector(self.refreshTable(_:)), for: .valueChanged)
    }
    
    @objc func refreshTable(_ sender: Any?) {
        loadImprovements()
        refreshControl?.endRefreshing()
    }
}
