//
//  County.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 17.11.2020.
//

import UIKit

struct County {
    let name: String
    let streets: [Street]
}

class CountyFactory {
    
    static func createCounties() -> [County] {
        let firstCounty = County(name: "1", streets: StreetFactory.createStreets())
        let secondCounty = County(name: "2", streets: StreetFactory.createStreets())
        let thirdCounty = County(name: "3", streets: StreetFactory.createStreets())
        let fourthCounty = County(name: "4", streets: StreetFactory.createStreets())
        let fifthCounty = County(name: "5", streets: StreetFactory.createStreets())
        let sixthCounty = County(name: "6", streets: StreetFactory.createStreets())
        let seventhCounty = County(name: "7", streets: StreetFactory.createStreets())
        let eighthCounty = County(name: "8", streets: StreetFactory.createStreets())
        let ninthCounty = County(name: "9", streets: StreetFactory.createStreets())
        let tenthCounty = County(name: "10", streets: StreetFactory.createStreets())
        let eleventhCounty = County(name: "11", streets: StreetFactory.createStreets())
        let twelfthCounty = County(name: "12", streets: StreetFactory.createStreets())
        let thirteenthCounty = County(name: "13", streets: StreetFactory.createStreets())
        let fourteenthCounty = County(name: "14", streets: StreetFactory.createStreets())
        let fifteenthCounty = County(name: "15", streets: StreetFactory.createStreets())
        let sixteenthCounty = County(name: "16", streets: StreetFactory.createStreets())
        let seventeenthCounty = County(name: "17", streets: StreetFactory.createStreets())
        let eighteenthCounty = County(name: "18", streets: StreetFactory.createStreets())
        let nineteenthCounty = County(name: "19", streets: StreetFactory.createStreets())
        let twentiethCounty = County(name: "20", streets: StreetFactory.createStreets())
        let twentyFirstCounty = County(name: "21", streets: StreetFactory.createStreets())
        let twentySecondCounty = County(name: "22", streets: StreetFactory.createStreets())
        let twentyThirdCounty = County(name: "23", streets: StreetFactory.createStreets())
        let twentyFourthCounty = County(name: "24", streets: StreetFactory.createStreets())
        let twentyFifthCounty = County(name: "25", streets: StreetFactory.createStreets())
        
        return [firstCounty, secondCounty, thirdCounty, fourthCounty, fifthCounty, sixthCounty, seventhCounty, eighthCounty, ninthCounty, tenthCounty, eleventhCounty, twelfthCounty, thirteenthCounty, fourteenthCounty, fifteenthCounty, sixteenthCounty, seventeenthCounty, eighteenthCounty, nineteenthCounty, twentiethCounty, twentyFirstCounty, twentySecondCounty, twentyThirdCounty, twentyFourthCounty, twentyFifthCounty]
    }
}
