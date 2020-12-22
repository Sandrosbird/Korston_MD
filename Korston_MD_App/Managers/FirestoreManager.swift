//
//  FirestoreManager.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 10.12.2020.
//

import UIKit
import FirebaseFirestore

class FirestoreManager {
    static let shared = FirestoreManager()
    private init(){}
    
    
    
    //MARK: - READ FROM DATABASE
    let database = Firestore.firestore()
    
    //MARK: - Districts
    func getDistricts(completion: @escaping ([DistrictFirebase]) -> Void) {
        var districtsArray: [DistrictFirebase] = []
        let districtsRef = database.collection("districts").order(by: "name")
        districtsRef.getDocuments { (snapshot, error) in
            if let error = error {
                print("Error occured: \(error)")
            } else {
                guard let documents = snapshot?.documents else { return }
                for document in documents {
                    print("doc data is \(document.data())")
                    let id = document.documentID
                    let district = DistrictFirebase(name: document.data()["name"] as! String, id: id)
                    districtsArray.append(district)
                }
                completion(districtsArray)
            }
        }
        print(districtsArray)
    }
    
    //MARK: - Counties
    func getCounties(for id: String, completion: @escaping ([CountyFirebase]) -> Void) {
        var countiesArray: [CountyFirebase] = []
        let countyRef = database.collection("districts/\(id)/local_districts")
        countyRef.getDocuments { (snapshot, error) in
            if let error = error {
                print("Error occured: \(error)")
            } else {
                guard let documents = snapshot?.documents else { return }
                for document in documents {
                    let id = document.documentID
//                    print("doc data is \(document.data())")
                    let county = CountyFirebase(id: id, name: document.data()["name"] as! String)
                    countiesArray.append(county)
                }
                countiesArray = countiesArray.sorted()
                completion(countiesArray)
            }
        }
    }
    
    //MARK: - Streets
    func getStreetFor(districtId: String, countyId: String, completion: @escaping ([StreetFirebase]) -> Void) {
        var streetsArray: [StreetFirebase] = []
        let ref = database.collection("districts/\(districtId)/local_districts/\(countyId)/streets").order(by: "name")
        ref.getDocuments { (snapshot, error) in
            if let error = error {
                print("Error occured: \(error)")
            } else {
                guard let documents = snapshot?.documents else { return }
                for document in documents {
//                    print("doc data is \(document.data())")
                    let id = document.documentID
                    let street = StreetFirebase(id: id, name: document.data()["name"] as! String)
                    streetsArray.append(street)
                }
                completion(streetsArray)
            }
        }
    }
    
    //MARK: - Houses
    func getHousesFor(districtId: String, countyId: String, streetId: String, completion: @escaping ([HouseFirebase]) -> Void) {
        var housesArray: [HouseFirebase] = []
        let ref = database.collection("/districts/\(districtId)/local_districts/\(countyId)/streets/\(streetId)/houses")
        ref.getDocuments { (snapshot, error) in
            if let error = error {
                print("Error occured: \(error)")
            } else {
                guard let documents = snapshot?.documents else { return }
                for document in documents {
//                    print("doc data is \(document.data())")
                    let id = document.documentID
                    let house = HouseFirebase(
                        id: id,
                        name: document.data()["name"] as! String,
                        imagePath: document.data()["imgpath"] as! String)
                        
                    housesArray.append(house)
                }
                housesArray = housesArray.sorted()
                completion(housesArray)
            }
        }
        print(housesArray)
    }
    
    //MARK: - Roomers
    func getRoomersFor(districtId: String, countyId: String, streetId: String, houseId: String, completion: @escaping ([SupporterFirebase]) -> Void) {
        var supportersArray: [SupporterFirebase] = []
        let ref = database.collection("/districts/\(districtId)/local_districts/\(countyId)/streets/\(streetId)/houses/\(houseId)/roomers")
        ref.getDocuments { (snapshot, error) in
            if let error = error {
                print("Error occured: \(error)")
            } else {
                guard let documents = snapshot?.documents else { return }
                for document in documents {
//                    print("doc data is \(document.data())")
                    let id = document.documentID
                    let supporter = SupporterFirebase(
                            id: id,
                            name: document.data()["name"] as! String,
                            apartment: document.data()["apartment"] as! String,
                            phone: document.data()["phone"] as! String,
                            email: document.data()["email"] as! String)
                    
                    supportersArray.append(supporter)
                }
                completion(supportersArray)
            }
        }
    }
    
    //MARK: - Improvements
    enum JobsType {
        case jobsDone, plannedJobs
    }
    
    func getJobsFor(districtId: String, countyId: String, streetId: String, houseId: String, type: JobsType, completion: @escaping ([ImprovementFirebase]) -> Void) {
        var improvementsArray: [ImprovementFirebase] = []
        var jobType: String = ""
        if type == .jobsDone {
            jobType = "jobs_done"
        } else {
            jobType = "jobs_not_done"
        }
        
        let ref = database.collection("districts/\(districtId)/local_districts/\(countyId)/streets/\(streetId)/houses/\(houseId)/\(jobType)")
        
        ref.getDocuments { (snapshot, error) in
            if let error = error {
                print("Error occured: \(error)")
            } else {
                guard let documents = snapshot?.documents else { return }
                for document in documents {
//                    print("doc data is \(document.data())")
                    let id = document.documentID
                    let improvement = ImprovementFirebase(
                        id: id,
                        name: document.data()["name"] as! String,
                        date: document.data()["date"] as! String,
                        contractor: document.data()["contractor"] as! String)
                    
                    improvementsArray.append(improvement)
                    
                }
                completion(improvementsArray)
            }
        }
    }
    
    //MARK: - WRITE - District
    func addDistrict(name: String) {
        database
            .collection("districts")
            .document()
            .setData([
                "name": "\(name)"
        ]) { error in
                if let error = error {
                   print("Ошибка добавления района: \(error)")
                } else {
                    print("Район \(name) добавлен")
                }
        }
    }
    
    //MARK: - WRITE - Counties
    func addCountyFor(name: String, for district: String) {
        database
            .collection("districts")
            .document(district)
            .collection("local_districts")
            .document()
            .setData([
                "name": "\(name)"
        ]) { error in
                if let error = error {
                   print("Ошибка добавления района: \(error)")
                } else {
                    print("Район \(name) добавлен")
                }
        }
    }
    
}

extension FirestoreManager: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}
