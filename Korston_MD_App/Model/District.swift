//
//  District.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 17.11.2020.
//

import UIKit

struct District {
    let name: String
    let counties: [County]
}

class DistrictFactory {
    
    static func createDistricts() -> [District] {
        let sovietDistrict = District(name: "Советский", counties: CountyFactory.createCounties())
        let aviationDistrict = District(name: "Авиастроительный", counties: CountyFactory.createCounties())
        let moscovDistrict = District(name: "Московский", counties: CountyFactory.createCounties())
        let vakhitovDistrict = District(name: "Вахитовский", counties: CountyFactory.createCounties())
        let kirovDistrict = District(name: "Кировский", counties: CountyFactory.createCounties())
        let novoSavinovDistrict = District(name: "Ново-Савиновский", counties: CountyFactory.createCounties())
        let privolzskiyDistrict = District(name: "Приволжский", counties: CountyFactory.createCounties())
        
         return [sovietDistrict, aviationDistrict, moscovDistrict, vakhitovDistrict, kirovDistrict, novoSavinovDistrict, privolzskiyDistrict]
    }
}
