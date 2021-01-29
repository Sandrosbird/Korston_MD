//
//  HouseFirebase.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 11.12.2020.
//

import UIKit

class HouseFirebase: Comparable {
    let id: String
    let name: String
    let imagePath: String
    
    init(id: String, name: String, imagePath: String) {
        self.id = id
        self.name = name
        self.imagePath = imagePath        
    }
    
    static func < (lhs: HouseFirebase, rhs: HouseFirebase) -> Bool {
        lhs.name.localizedStandardCompare(rhs.name) == .orderedAscending
    }
    
    static func == (lhs: HouseFirebase, rhs: HouseFirebase) -> Bool {
        if lhs == rhs {
            return true
        } else {
            return false
        }
    }
}
