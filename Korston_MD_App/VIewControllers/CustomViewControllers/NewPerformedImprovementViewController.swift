//
//  NewPerformedImprovementViewController.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 24.12.2020.
//

import UIKit

class NewPerformedImprovementViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var contractorNameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var workNameTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    //MARK: - Properties
    let firestore = FirestoreManager.shared
    var districtId = ""
    var countyId = ""
    var streetId = ""
    var houseId = ""
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
    
    @IBAction func addButtonDidTap(_ sender: Any) {
        guard let contractor = contractorNameTextField.text,
              let date = dateTextField.text,
              let jobName = workNameTextField.text
        else {
            return
        }
        firestore.addImprovementFor(type: .jobsDone, jobName: jobName, contractor: contractor, date: date, forDistrict: districtId, forCounty: countyId, forStreet: streetId, forHouse: houseId)
        
        let alert = UIAlertController(title: "Добавлено!", message: "Подрядчик: \(contractor)\nДата: \(date)\nРабота: \(jobName)", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "ОК", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        contractorNameTextField.text = ""
        dateTextField.text = ""
        workNameTextField.text = ""
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Helpers
    func setUpElements() {
        //Set style to the text fields and buttons
        StyleButtonsFields.styleTextField(contractorNameTextField)
        StyleButtonsFields.styleTextField(dateTextField)
        StyleButtonsFields.styleTextField(workNameTextField)
        StyleButtonsFields.styleFilledButton(addButton)
        
    }
}
