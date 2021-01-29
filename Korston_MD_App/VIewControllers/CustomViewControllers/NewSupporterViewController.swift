//
//  NewSupporterViewController.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 24.12.2020.
//

import UIKit

class NewSupporterViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var apartmentTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
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
        guard let name = nameTextField.text,
              let apartment = apartmentTextField.text,
              let phone = phoneTextField.text,
              let email = emailTextField.text
        else {
            return
        }
        firestore.addSupporterFor(name: name, apartment: apartment, email: email, phone: phone, forDistrict: districtId, forCounty: countyId, forStreet: streetId, forHouse: houseId)
        
        let alert = UIAlertController(title: "Добавлено!", message: "\(name) успешно добавлен(а)!", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "ОК", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        nameTextField.text = ""
        apartmentTextField.text = ""
        phoneTextField.text = ""
        emailTextField.text = ""
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Helpers
    func setUpElements() {
        //Set style to the text fields and buttons
        StyleButtonsFields.styleTextField(nameTextField)
        StyleButtonsFields.styleTextField(apartmentTextField)
        StyleButtonsFields.styleTextField(phoneTextField)
        StyleButtonsFields.styleTextField(emailTextField)
        StyleButtonsFields.styleFilledButton(addButton)
        
    }
}
