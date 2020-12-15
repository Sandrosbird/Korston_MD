//
//  DatabaseManager.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 05.12.2020.
//

import UIKit
import SQLite3

final class DatabaseManager {
    static let shared = DatabaseManager()
    private init(){
        database = openDatabase()
    }
    
    let fileManager = FileManager.default
    
    let databasePath = "municipality.db"
    var database: OpaquePointer? = nil
    
    func copyDatabaseIfNeeded() {
        // Move database file from bundle to documents folder
        
        let fileManager = FileManager.default
        
        let documentsUrl = fileManager.urls(for: .documentDirectory,
                                            in: .userDomainMask)
        
        guard documentsUrl.count != 0 else {
            return // Could not find documents URL
        }
        
        let finalDatabaseURL = documentsUrl.first!.appendingPathComponent(databasePath)
        
        if !( (try? finalDatabaseURL.checkResourceIsReachable()) ?? false) {
            print("DB does not exist in documents folder")
            
            let documentsURL = Bundle.main.resourceURL?.appendingPathComponent(databasePath)
            
            do {
                try fileManager.copyItem(atPath: (documentsURL?.path)!, toPath: finalDatabaseURL.path)
            } catch let error as NSError {
                print("Couldn't copy file to final location! Error:\(error.description)")
            }
            
        } else {
            print("Database file found at path: \(finalDatabaseURL.path)")
        }
        
    }
    
    func openDatabase() -> OpaquePointer? {
        copyDatabaseIfNeeded()
        let fileUrl = try! fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent(databasePath)
        print(fileUrl)
        var database: OpaquePointer? = nil
        if sqlite3_open(fileUrl.path, &database) != SQLITE_OK {
            print("Error opening DB")
            return nil
        } else {
            print("DB opening at path \(databasePath) is OK")
            return database
        }
    }
    
    func readDistricts() -> [District] {
        let queryStatementString = "SELECT * FROM districts"
        var queryStatement: OpaquePointer? = nil
        var districts: [District] = []
        
        if sqlite3_prepare_v2(database, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = Int(sqlite3_column_int(queryStatement, 0))
                let name = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                districts.append(District(name: name, id: id))
            }
        } else {
            print("SELECT statement could not be completed")
        }
        sqlite3_finalize(queryStatement)
        return districts
    }
    
    func readCounties(id: Int) -> [County] {
        let queryStatementString = "SELECT * FROM local_districts WHERE district_id = \(id)"
        var queryStatement: OpaquePointer? = nil
        var counties: [County] = []
        
        if sqlite3_prepare_v2(database, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, 0)
                let name = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let districtId = sqlite3_column_int(queryStatement, 2)
                counties.append(County(id: Int(id), name: name, districtId: Int(districtId)))
            }
        } else {
            print("SELECT statement could not be completed")
        }
        
        sqlite3_finalize(queryStatement)
        return counties
    }
    
    func readStreets(id: Int) -> [Street] {
        let queryStatementString = "SELECT * FROM streets WHERE local_district_id = \(id)"
        var queryStatement: OpaquePointer? = nil
        var streets: [Street] = []
        
        if sqlite3_prepare_v2(database, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = Int(sqlite3_column_int(queryStatement, 0))
                let name = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let districtId = Int(sqlite3_column_int(queryStatement, 2))
                let localDistrictID = Int(sqlite3_column_int(queryStatement, 3))
                streets.append(Street(id: id, streetName: name, districtId: districtId, localDistrictId: localDistrictID))
            }
        } else {
            print("SELECT statement could not be completed")
        }
        
        sqlite3_finalize(queryStatement)
        return streets
    }
    
    func readHouses(id: Int) -> [House] {
        let queryStatementString = "SELECT * FROM houses WHERE street_id = \(id)"
        var queryStatement: OpaquePointer? = nil
        var houses: [House] = []
        
        if sqlite3_prepare_v2(database, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = Int(sqlite3_column_int(queryStatement, 0))
                let houseNumber = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let districtId = Int(sqlite3_column_int(queryStatement, 2))
                let localDistrictId = Int(sqlite3_column_int(queryStatement, 3))
                let streetId = Int(sqlite3_column_int(queryStatement, 4))
                houses.append(House(id: id, houseNumber: houseNumber, districtId: districtId, localDistrictId: localDistrictId, streetId: streetId))
            }
        } else {
            print("SELECT statement could not be completed")
        }
        print(houses)
        sqlite3_finalize(queryStatement)
        return houses
    }
    
    func readHousePhotos(id: Int) -> [UIImage] {
        let queryStatementString = "SELECT * FROM house_pictures WHERE house_id = \(id)"
        var queryStatement: OpaquePointer? = nil
        var houseImages: [UIImage] = []
        
        if sqlite3_prepare_v2(database, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = Int(sqlite3_column_int(queryStatement, 0))
                let fileName = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let houseId = Int(sqlite3_column_int(queryStatement, 2))
                houseImages.append(UIImage(named: fileName) ?? UIImage(named: "nodata")!)
            }
        } else {
            print("SELECT statement could not be completed")
        }
        sqlite3_finalize(queryStatement)
        return houseImages
    }
    
    func readSupporters(id: Int) -> [Supporter] {
        let queryStatementString = "SELECT * FROM house_roomers WHERE house_id = \(id)"
        var queryStatement: OpaquePointer? = nil
        var supporters: [Supporter] = []
        
        if sqlite3_prepare_v2(database, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = Int(sqlite3_column_int(queryStatement, 0))
                let name = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let apartment = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let phone = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                let email = String(describing: String(cString: sqlite3_column_text(queryStatement, 4)))
                let houseId = Int(sqlite3_column_int(queryStatement, 5))
                supporters.append(Supporter(id: id, name: name, apartment: apartment, phone: phone, email: email, houseId: houseId))
            }
        } else {
            print("SELECT statement could not be completed")
        }
        sqlite3_finalize(queryStatement)
        return supporters
    }
    
    enum ImprovementType {
        case jobsDone, plannedJobs
    }
    
    func readImprovements(id: Int, type: ImprovementType) -> [Improvement] {
        var queryStatementString = ""
        switch type {
        case .jobsDone:
            queryStatementString = "SELECT * FROM house_jobs_done WHERE house_id = \(id)"
        case .plannedJobs:
            queryStatementString = "SELECT * FROM house_jobs_not_done WHERE house_id = \(id)"
        default:
            queryStatementString = "SELECT * FROM house_jobs_done WHERE house_id = \(id)"
        }
       
        var queryStatement: OpaquePointer? = nil
        var improvements: [Improvement] = []
        
        if sqlite3_prepare_v2(database, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = Int(sqlite3_column_int(queryStatement, 0))
                let name = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let date = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let contractor = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                let houseId = Int(sqlite3_column_int(queryStatement, 4))
                improvements.append(Improvement(id: id, workName: name, date: date, contractor: contractor, houseId: houseId))
            }
        } else {
            print("SELECT statement could not be completed")
        }
        sqlite3_finalize(queryStatement)
        return improvements
    }
}
