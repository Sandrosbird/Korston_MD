//
//  NewStreetViewController.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 23.12.2020.
//

import UIKit

class NewStreetViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var newStreetTextFIeld: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    //MARK: - Properties
    let firestore = FirestoreManager.shared
    var districtId = ""
    var countyId = ""
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
    @IBAction func addButtonDidTap(_ sender: Any) {
        guard let streetName = newStreetTextFIeld.text else {
            return
        }
        firestore.addStreetFor(name: streetName, forDistrict: districtId, forCounty: countyId)
        
        let alert = UIAlertController(title: "Добавлено!", message: "Улица \(streetName) успешно добавлена!", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "ОК", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        newStreetTextFIeld.text = ""
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Helpers
    func setUpElements() {
        //Set style to the text fields and buttons
        StyleButtonsFields.styleTextField(newStreetTextFIeld)
        StyleButtonsFields.styleFilledButton(addButton)
        
    }
}
