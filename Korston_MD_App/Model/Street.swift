//
//  Street.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 17.11.2020.
//

import UIKit

struct Street {
    let name: String
    let image: UIImage?
    let houses: [House]
}

class StreetFactory {
    
    static func createStreets() -> [Street] {
        let street1 = Street(name: "Карла Маркса", image: UIImage(named: "CarlMarks") ?? nil, houses: HouseFactory.createHouses(count: 10))
        let street2 = Street(name: "Гоголя", image: UIImage(named: "Gogolya") ?? nil, houses: HouseFactory.createHouses(count: 15))
        let street3 = Street(name: "Максимова", image: UIImage(named: "Maksimova") ?? nil, houses: HouseFactory.createHouses(count: 16))
        let street4 = Street(name: "Ленина", image: UIImage(named: "Lenina") ?? nil, houses: HouseFactory.createHouses(count: 18))
        let street5 = Street(name: "Московская", image: UIImage(named: "Moskovskaya") ?? nil, houses: HouseFactory.createHouses(count: 20))
        let street6 = Street(name: "Гладилова", image: UIImage(named: "Gladilova") ?? nil, houses: HouseFactory.createHouses(count: 10))
        let street7 = Street(name: "Адоратского", image: UIImage(named: "Adoratskogo") ?? nil, houses: HouseFactory.createHouses(count: 17))
        let street8 = Street(name: "Чистопольская", image: UIImage(named: "Chistopolskaya") ?? nil, houses: HouseFactory.createHouses(count: 9))
        let street9 = Street(name: "Кремлевская", image: UIImage(named: "Kremlevskaya") ?? nil, houses: HouseFactory.createHouses(count: 11))
        let street10 = Street(name: "Ямашева", image: UIImage(named: "Yamasheva") ?? nil, houses: HouseFactory.createHouses(count: 10))
        
        return [street1, street2, street3, street4, street5, street6, street7, street8, street9, street10]
    }
}
