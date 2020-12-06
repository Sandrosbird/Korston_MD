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
        let firstCounty = County(name: "Округ №1", streets: StreetFactory.createStreets())
        let secondCounty = County(name: "Округ №2", streets: StreetFactory.createStreets())
        let thirdCounty = County(name: "Округ №3", streets: StreetFactory.createStreets())
        let fourthCounty = County(name: "Округ №4", streets: StreetFactory.createStreets())
        let fifthCounty = County(name: "Округ №5", streets: StreetFactory.createStreets())
        let sixthCounty = County(name: "Округ №6", streets: StreetFactory.createStreets())
        let seventhCounty = County(name: "Округ №7", streets: StreetFactory.createStreets())
        let eighthCounty = County(name: "Округ №8", streets: StreetFactory.createStreets())
        let ninthCounty = County(name: "Округ №9", streets: StreetFactory.createStreets())
        let tenthCounty = County(name: "Округ №10", streets: StreetFactory.createStreets())
        let eleventhCounty = County(name: "Округ №11", streets: StreetFactory.createStreets())
        let twelfthCounty = County(name: "Округ №12", streets: StreetFactory.createStreets())
        let thirteenthCounty = County(name: "Округ №13", streets: StreetFactory.createStreets())
        let fourteenthCounty = County(name: "Округ №14", streets: StreetFactory.createStreets())
        let fifteenthCounty = County(name: "Округ №15", streets: StreetFactory.createStreets())
        let sixteenthCounty = County(name: "Округ №16", streets: StreetFactory.createStreets())
        let seventeenthCounty = County(name: "Округ №17", streets: StreetFactory.createStreets())
        let eighteenthCounty = County(name: "Округ №18", streets: StreetFactory.createStreets())
        let nineteenthCounty = County(name: "Округ №19", streets: StreetFactory.createStreets())
        let twentiethCounty = County(name: "Округ №20", streets: StreetFactory.createStreets())
        let twentyFirstCounty = County(name: "Округ №21", streets: StreetFactory.createStreets())
        let twentySecondCounty = County(name: "Округ №22", streets: StreetFactory.createStreets())
        let twentyThirdCounty = County(name: "Округ №23", streets: StreetFactory.createStreets())
        let twentyFourthCounty = County(name: "Округ №24", streets: StreetFactory.createStreets())
        let twentyFifthCounty = County(name: "Округ №25", streets: StreetFactory.createStreets())
        
        return [firstCounty, secondCounty, thirdCounty, fourthCounty, fifthCounty, sixthCounty, seventhCounty, eighthCounty, ninthCounty, tenthCounty, eleventhCounty, twelfthCounty, thirteenthCounty, fourteenthCounty, fifteenthCounty, sixteenthCounty, seventeenthCounty, eighteenthCounty, nineteenthCounty, twentiethCounty, twentyFirstCounty, twentySecondCounty, twentyThirdCounty, twentyFourthCounty, twentyFifthCounty]
    }
}
