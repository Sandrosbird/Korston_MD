//
//  LoginViewController.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 16.12.2020.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        setUpElements()
    }
    
    func setUpElements() {
        //Set style to the text fields
        StyleButtonsFields.styleTextField(loginTextField)
        StyleButtonsFields.styleTextField(passwordTextField)
        StyleButtonsFields.styleFilledButton(loginButton)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: loginTextField.text!, password: passwordTextField.text!) { [weak self] (result, error) in
            if let error = error {
                let alert = UIAlertController(title: "Ошибка!", message: "Логин/пароль введены неверно \(error.localizedDescription)", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "ОК", style: .cancel, handler: nil)
                alert.addAction(cancelAction)
                self?.present(alert, animated: true, completion: nil)
            } else {
                AuthManager.shared.isAuthorized = true
//                self?.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }
    
}
