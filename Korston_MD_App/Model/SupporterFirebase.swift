//
//  SupporterFirebase.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 11.12.2020.
//

import Foundation

class SupporterFirebase {
    var id: String
    var name: String
    var apartment: String
    var phone: String
    var email: String
    
    init(id: String, name: String, apartment: String, phone: String, email: String){
        self.id = id
        self.name = name
        self.apartment = apartment
        self.phone = phone
        self.email = email
    }
}
