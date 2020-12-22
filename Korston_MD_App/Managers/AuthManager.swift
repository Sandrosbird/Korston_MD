//
//  AuthManager.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 17.12.2020.
//

import UIKit
import FirebaseAuth

class AuthManager {
    static let shared = AuthManager()
    private init() {}
    
    var isAuthorized: Bool = false
    
    func signOut(viewController: UIViewController) {
        do{
            try Auth.auth().signOut()
            print("signed out")
            isAuthorized = false
        } catch {
            let alert = UIAlertController(title: "Ошибка!", message: error.localizedDescription, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "ОК", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            
            viewController.present(alert, animated: true, completion: nil)
        }
        
    }
}

extension AuthManager: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}
