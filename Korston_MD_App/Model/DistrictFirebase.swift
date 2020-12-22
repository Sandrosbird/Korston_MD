//
//  DistrictFirebase.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 11.12.2020.
//

import UIKit

class DistrictFirebase: Equatable {
    
    static func == (lhs: DistrictFirebase, rhs: DistrictFirebase) -> Bool {
        if lhs == rhs {
            return true
        } else {
            return false
        }
    }
    
    let name: String
    let id: String
    
    init(name: String, id: String) {
        self.name = name
        self.id = id
    }
}
