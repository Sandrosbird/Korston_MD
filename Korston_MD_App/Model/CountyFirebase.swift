//
//  CountyFirebase.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 11.12.2020.
//

import UIKit

class CountyFirebase: Comparable {
    static func < (lhs: CountyFirebase, rhs: CountyFirebase) -> Bool {
        lhs.name.localizedStandardCompare(rhs.name) == .orderedAscending
    }
    
    static func == (lhs: CountyFirebase, rhs: CountyFirebase) -> Bool {
        if lhs == rhs {
            return true
        } else {
            return false
        }
    }
    
    let id: String
    let name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
