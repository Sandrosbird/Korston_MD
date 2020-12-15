//
//  Supporter.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 26.11.2020.
//

import Foundation

class Supporter {
    var id: Int
    var name: String
    var apartment: String
    var phone: String
    var email: String
    var houseId: Int
    
    init(id: Int, name: String, apartment: String, phone: String, email: String, houseId: Int){
        self.id = id
        self.name = name
        self.apartment = apartment
        self.phone = phone
        self.email = email
        self.houseId = houseId
    }
}

//final class SupporterFactory {
//    static func createSupporters() -> [Supporter] {
//        let first = Supporter(name: "Ильин Павел Николаевич", apartment: 3, phone: "89098762456", email: "PNIlin@domain.com")
//        let second = Supporter(name: "Новиков Дмитрий Сергеевич", apartment: 17, phone: "89178883457", email: "dmitSNow@domain.com")
//        let third = Supporter(name: "Кислицин Олег Эдуардович", apartment: 22, phone: "89992234787", email: "kislOE@domain.com")
//        
//        return [first, second, third]
//    }
//}
