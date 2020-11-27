//
//  City.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 17.11.2020.
//

import UIKit

struct City {
    let name: String
    let districts: [District]
}

class CityFactory {
    
    func createCity() -> City {
        let kazanCity = City(name: "Kazan", districts: DistrictFactory.createDistricts())
        
        return kazanCity
    }
}
