//
//  NewDistrictVIewController.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 22.12.2020.
//

import UIKit

class NewDistrictViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var newDistrictTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    //MARK: - Properties
    let firestore = FirestoreManager.shared
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
    @IBAction func addButtonDidTap(_ sender: Any) {
        guard let districtName = newDistrictTextField.text else {
            return
        }
        firestore.addDistrict(name: districtName)
        let alert = UIAlertController(title: "Добавлено!", message: "\(districtName) район успешно добавлен!", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "ОК", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        newDistrictTextField.text = ""
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Helpers
    func setUpElements() {
        //Set style to the text fields and buttons
        StyleButtonsFields.styleTextField(newDistrictTextField)
        StyleButtonsFields.styleFilledButton(addButton)
        
    }
    
}
