//
//  NewCountyViewController.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 22.12.2020.
//

import UIKit

class NewCountyViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var newCountyTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    //MARK: - Properties
    let firestore = FirestoreManager.shared
    var districtId = ""
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
    @IBAction func addButtonDidTap(_ sender: Any) {
        guard let countyName = newCountyTextField.text else {
            return
        }
        firestore.addCountyFor(name: countyName, for: districtId)
        
        let alert = UIAlertController(title: "Добавлено!", message: "Округ №\(countyName) успешно добавлен!", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "ОК", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        newCountyTextField.text = ""
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Helpers
    func setUpElements() {
        //Set style to the text fields and buttons
        StyleButtonsFields.styleTextField(newCountyTextField)
        StyleButtonsFields.styleFilledButton(addButton)
        
    }
}
