//
//  NewHouseViewController.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 23.12.2020.
//

import UIKit

class NewHouseViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var newHouseTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    //MARK: - Properties
    let firestore = FirestoreManager.shared
    var districtId = ""
    var countyId = ""
    var streetId = ""
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
    
    @IBAction func addButtonDidTap(_ sender: Any) {
        guard let houseName = newHouseTextField.text else {
            return
        }
        firestore.addHouseFor(name: houseName, forDistrict: districtId, forCounty: countyId, forStreet: streetId)
        
        let alert = UIAlertController(title: "Добавлено!", message: "Дом №\(houseName) успешно добавлен!", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "ОК", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        newHouseTextField.text = ""
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Helpers
    func setUpElements() {
        //Set style to the text fields and buttons
        StyleButtonsFields.styleTextField(newHouseTextField)
        StyleButtonsFields.styleFilledButton(addButton)
        
    }
}
