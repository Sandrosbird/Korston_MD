//
//  Improvements.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 27.11.2020.
//

import UIKit

class Improvement {
    let id: Int
    let workName: String
    let date: String
    let contractor: String
    let houseId: Int
    
    init(id: Int, workName: String, date: String, contractor: String, houseId: Int) {
        self.id = id
        self.workName = workName
        self.date = date
        self.contractor = contractor
        self.houseId = houseId
    }
}

//final class ImprovementsFactory {
//    static func getPerformedImprovements() -> [Improvement] {
//        let complexYard = Improvement(date: "24 апреля 2020 года", workName: "Комплексное благоустройтсво дворовой территории", contractor: "УК Город")
//        let entranceDoors = Improvement(date: "3 июля 2020 года", workName: "Замена дверей подъездов", contractor: "ООО 'Ханд'")
//        let electricity = Improvement(date: "12 сентября 2020 года", workName: "Ремонт проводки в подъездах №3-5", contractor: "УК Город")
//        let snowHolders = Improvement(date: "7 ноября 2020 года", workName: "Замена снегоуловителей на крыше", contractor: "УК Город")
//        
//        return [complexYard, entranceDoors, electricity, snowHolders]
//    }
//    
//    static func getPlannedImprovements() -> [Improvement] {
//        let innerRoad = Improvement(date: "3 марта 2021 года", workName: "Контроль качества внутридворового проезда", contractor: "ТСЖ 'ЛУЧ'")
//        let playground = Improvement(date: "1 апреля 2021 года", workName: "Обследование и ремонт детской площадки", contractor: "ТСЖ 'ЛУЧ'")
//        let cleaning = Improvement(date: "10 марта 2020 года", workName: "Комплексная уборка мест общего пользования", contractor: "ГК 'Сантей'")
//        return [innerRoad, playground, cleaning]
//    }
//}
