//
//  StreetFirebase.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 11.12.2020.
//

import UIKit

class StreetFirebase: Comparable {
    let id: String
    let name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
    
    static func < (lhs: StreetFirebase, rhs: StreetFirebase) -> Bool {
        lhs.name.localizedStandardCompare(rhs.name) == .orderedAscending
    }
    
    static func == (lhs: StreetFirebase, rhs: StreetFirebase) -> Bool {
        if lhs == rhs {
            return true
        } else {
            return false
        }
    }
}
