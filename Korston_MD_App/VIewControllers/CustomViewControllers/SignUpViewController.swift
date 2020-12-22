//
//  SignUpViewController.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 16.12.2020.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    @IBOutlet weak var authorisationButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        AuthManager.shared.signOut(viewController: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)

    }
    
    func setUpElements() {
        StyleButtonsFields.styleFilledButton(authorisationButton)
        StyleButtonsFields.styleHollowButton(continueButton)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "424484")!)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func withoutSignInButtonTapped(_ sender: Any) {
        if AuthManager.shared.isAuthorized == true {
            let alert = UIAlertController(title: "Внимание!", message: "Продолжив без авторизации вы выйдете из своего аккаунта. Вам будут недоступны функции добавления контента", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Подтвердить", style: .cancel) { (action) in
                AuthManager.shared.signOut(viewController: self)
                self.performSegue(withIdentifier: "continueUnAuthorized", sender: nil)
            }
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
            
        } else {
            self.performSegue(withIdentifier: "continueUnAuthorized", sender: nil)
        }
    }
    
}
