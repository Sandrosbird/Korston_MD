//
//  House.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 17.11.2020.
//

import UIKit

struct House {
    let type: String
    let number: Int
    let entranses: Int
    let numberOfStoreys: Int
    let numberOfApartments: Int
    let managementCompany: String
    let photoes: [UIImage]
    let supporters: [Supporter]
    let plannedImprovements: [Improvement]
    let performedImprovements: [Improvement]
}


class HouseFactory {
    static func createHouses(count: Int) -> [House] {
        var arrayOfHouses: [House] = []
        
        let house1 = House(type: "МКД", number: 1, entranses: 5, numberOfStoreys: 12, numberOfApartments: 345, managementCompany: "ТСЖ 'Лазурный берег'", photoes: [UIImage(named: "Ador1")!, UIImage(named: "Ador2")!, UIImage(named: "Ador3")!, UIImage(named: "Ador4")!, UIImage(named: "Ador5")!], supporters: SupporterFactory.createSupporters(), plannedImprovements: ImprovementsFactory.getPlannedImprovements(), performedImprovements: ImprovementsFactory.getPerformedImprovements())
        
        let house2 = House(type: "МКД", number: 2, entranses: 7, numberOfStoreys: 5, numberOfApartments: 210, managementCompany: "ООО 'Управляющая компания Вахитовского района'", photoes: [UIImage(named: "Ostr1")!, UIImage(named: "Ostr2")!, UIImage(named: "Ostr3")!, UIImage(named: "Ostr4")!, UIImage(named: "Ostr5")!], supporters: SupporterFactory.createSupporters(), plannedImprovements: ImprovementsFactory.getPlannedImprovements(), performedImprovements: ImprovementsFactory.getPerformedImprovements())
        
        let house3 = House(type: "МКД", number: 3, entranses: 3, numberOfStoreys: 5, numberOfApartments: 44, managementCompany: "ЖКХ Приволжского района", photoes: [UIImage(named: "Hadi1")!, UIImage(named: "Hadi2")!, UIImage(named: "Hadi3")!], supporters: SupporterFactory.createSupporters(), plannedImprovements: ImprovementsFactory.getPlannedImprovements(), performedImprovements: ImprovementsFactory.getPerformedImprovements())
        
        let house4 = House(type: "МКД", number: 4, entranses: 2, numberOfStoreys: 5, numberOfApartments: 40, managementCompany: "ЖСК ТЕМП-9", photoes: [UIImage(named: "Bel1")!, UIImage(named: "Bel2")!, UIImage(named: "Bel3")!, UIImage(named: "Bel4")!], supporters: SupporterFactory.createSupporters(), plannedImprovements: ImprovementsFactory.getPlannedImprovements(), performedImprovements: ImprovementsFactory.getPerformedImprovements())
        
        let house5 = House(type: "МКД", number: 5, entranses: 5, numberOfStoreys: 14, numberOfApartments: 394, managementCompany: "УК 'Уютный дом'", photoes: [UIImage(named: "Amir1")!, UIImage(named: "Amir2")!, UIImage(named: "Amir3")!], supporters: SupporterFactory.createSupporters(), plannedImprovements: ImprovementsFactory.getPlannedImprovements(), performedImprovements: ImprovementsFactory.getPerformedImprovements())
        
        let house6 = House(type: "МКД", number: 6, entranses: 3, numberOfStoreys: 10, numberOfApartments: 345, managementCompany: "УК Уют", photoes: [UIImage(named: "Chet1")!, UIImage(named: "Chet2")!, UIImage(named: "Chet3")!, UIImage(named: "Chet4")!], supporters: SupporterFactory.createSupporters(), plannedImprovements: ImprovementsFactory.getPlannedImprovements(), performedImprovements: ImprovementsFactory.getPerformedImprovements())
        
        let house7 = House(type: "МКД", number: 7, entranses: 5, numberOfStoreys: 12, numberOfApartments: 345, managementCompany: "ТСЖ 'Лазурный берег'", photoes: [UIImage(named: "Ador1")!, UIImage(named: "Ador2")!, UIImage(named: "Ador3")!, UIImage(named: "Ador4")!, UIImage(named: "Ador5")!], supporters: SupporterFactory.createSupporters(), plannedImprovements: ImprovementsFactory.getPlannedImprovements(), performedImprovements: ImprovementsFactory.getPerformedImprovements())
        
        let house8 = House(type: "МКД", number: 8, entranses: 3, numberOfStoreys: 5, numberOfApartments: 44, managementCompany: "ЖКХ Приволжского района", photoes: [UIImage(named: "Hadi1")!, UIImage(named: "Hadi2")!, UIImage(named: "Hadi3")!], supporters: SupporterFactory.createSupporters(), plannedImprovements: ImprovementsFactory.getPlannedImprovements(), performedImprovements: ImprovementsFactory.getPerformedImprovements())
        
        let house9 = House(type: "МКД", number: 9, entranses: 7, numberOfStoreys: 5, numberOfApartments: 210, managementCompany: "ООО 'Управляющая компания Вахитовского района'", photoes: [UIImage(named: "Ostr1")!, UIImage(named: "Ostr2")!, UIImage(named: "Ostr3")!, UIImage(named: "Ostr4")!, UIImage(named: "Ostr5")!], supporters: SupporterFactory.createSupporters(), plannedImprovements: ImprovementsFactory.getPlannedImprovements(), performedImprovements: ImprovementsFactory.getPerformedImprovements())
        
        let house10 = House(type: "МКД", number: 10, entranses: 5, numberOfStoreys: 14, numberOfApartments: 394, managementCompany: "УК 'Уютный дом'", photoes: [UIImage(named: "Amir1")!, UIImage(named: "Amir2")!, UIImage(named: "Amir3")!], supporters: SupporterFactory.createSupporters(), plannedImprovements: ImprovementsFactory.getPlannedImprovements(), performedImprovements: ImprovementsFactory.getPerformedImprovements())
        
        let house11 = House(type: "МКД", number: 11, entranses: 5, numberOfStoreys: 12, numberOfApartments: 345, managementCompany: "ТСЖ 'Лазурный берег'", photoes: [UIImage(named: "Ador1")!, UIImage(named: "Ador2")!, UIImage(named: "Ador3")!, UIImage(named: "Ador4")!, UIImage(named: "Ador5")!], supporters: SupporterFactory.createSupporters(), plannedImprovements: ImprovementsFactory.getPlannedImprovements(), performedImprovements: ImprovementsFactory.getPerformedImprovements())
        
        let house12 = House(type: "МКД", number: 4, entranses: 2, numberOfStoreys: 5, numberOfApartments: 40, managementCompany: "ЖСК ТЕМП-9", photoes: [UIImage(named: "Bel1")!, UIImage(named: "Bel2")!, UIImage(named: "Bel3")!, UIImage(named: "Bel4")!], supporters: SupporterFactory.createSupporters(), plannedImprovements: ImprovementsFactory.getPlannedImprovements(), performedImprovements: ImprovementsFactory.getPerformedImprovements())
        
        let house13 = House(type: "МКД", number: 13, entranses: 7, numberOfStoreys: 5, numberOfApartments: 210, managementCompany: "ООО 'Управляющая компания Вахитовского района'", photoes: [UIImage(named: "Ostr1")!, UIImage(named: "Ostr2")!, UIImage(named: "Ostr3")!, UIImage(named: "Ostr4")!, UIImage(named: "Ostr5")!], supporters: SupporterFactory.createSupporters(), plannedImprovements: ImprovementsFactory.getPlannedImprovements(), performedImprovements: ImprovementsFactory.getPerformedImprovements())
        
        let house14 = House(type: "МКД", number: 14, entranses: 3, numberOfStoreys: 5, numberOfApartments: 44, managementCompany: "ЖКХ Приволжского района", photoes: [UIImage(named: "Hadi1")!, UIImage(named: "Hadi2")!, UIImage(named: "Hadi3")!], supporters: SupporterFactory.createSupporters(), plannedImprovements: ImprovementsFactory.getPlannedImprovements(), performedImprovements: ImprovementsFactory.getPerformedImprovements())
        
        let house15 = House(type: "МКД", number: 15, entranses: 5, numberOfStoreys: 12, numberOfApartments: 345, managementCompany: "ТСЖ 'Лазурный берег'", photoes: [UIImage(named: "Ador1")!, UIImage(named: "Ador2")!, UIImage(named: "Ador3")!, UIImage(named: "Ador4")!, UIImage(named: "Ador5")!], supporters: SupporterFactory.createSupporters(), plannedImprovements: ImprovementsFactory.getPlannedImprovements(), performedImprovements: ImprovementsFactory.getPerformedImprovements())
        
        let house16 = House(type: "МКД", number: 4, entranses: 2, numberOfStoreys: 5, numberOfApartments: 40, managementCompany: "ЖСК ТЕМП-9", photoes: [UIImage(named: "Bel1")!, UIImage(named: "Bel2")!, UIImage(named: "Bel3")!, UIImage(named: "Bel4")!], supporters: SupporterFactory.createSupporters(), plannedImprovements: ImprovementsFactory.getPlannedImprovements(), performedImprovements: ImprovementsFactory.getPerformedImprovements())
        
        let house17 = House(type: "МКД", number: 17, entranses: 7, numberOfStoreys: 5, numberOfApartments: 210, managementCompany: "ООО 'Управляющая компания Вахитовского района'", photoes: [UIImage(named: "Ostr1")!, UIImage(named: "Ostr2")!, UIImage(named: "Ostr3")!, UIImage(named: "Ostr4")!, UIImage(named: "Ostr5")!], supporters: SupporterFactory.createSupporters(), plannedImprovements: ImprovementsFactory.getPlannedImprovements(), performedImprovements: ImprovementsFactory.getPerformedImprovements())
        
        let house18 = House(type: "МКД", number: 18, entranses: 5, numberOfStoreys: 14, numberOfApartments: 394, managementCompany: "УК 'Уютный дом'", photoes: [UIImage(named: "Amir1")!, UIImage(named: "Amir2")!, UIImage(named: "Amir3")!], supporters: SupporterFactory.createSupporters(), plannedImprovements: ImprovementsFactory.getPlannedImprovements(), performedImprovements: ImprovementsFactory.getPerformedImprovements())
        
        let house19 = House(type: "МКД", number: 19, entranses: 3, numberOfStoreys: 5, numberOfApartments: 44, managementCompany: "ЖКХ Приволжского района", photoes: [UIImage(named: "Hadi1")!, UIImage(named: "Hadi2")!, UIImage(named: "Hadi3")!], supporters: SupporterFactory.createSupporters(), plannedImprovements: ImprovementsFactory.getPlannedImprovements(), performedImprovements: ImprovementsFactory.getPerformedImprovements())
        
        let house20 = House(type: "МКД", number: 20, entranses: 7, numberOfStoreys: 5, numberOfApartments: 210, managementCompany: "ООО 'Управляющая компания Вахитовского района'", photoes: [UIImage(named: "Ostr1")!, UIImage(named: "Ostr2")!, UIImage(named: "Ostr3")!, UIImage(named: "Ostr4")!, UIImage(named: "Ostr5")!], supporters: SupporterFactory.createSupporters(), plannedImprovements: ImprovementsFactory.getPlannedImprovements(), performedImprovements: ImprovementsFactory.getPerformedImprovements())
        
        
        arrayOfHouses = [house1, house2, house3, house4, house5, house6, house7, house8, house9, house10, house11, house12, house13, house14, house15, house16, house17, house18, house19, house20]
        
        arrayOfHouses.removeLast(arrayOfHouses.count-count)
        

        return arrayOfHouses
    }
}

