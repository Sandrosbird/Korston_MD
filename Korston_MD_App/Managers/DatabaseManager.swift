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
    
    func openDatabase() -> OpaquePointer? {
        let fileUrl = try! fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent(databasePath)
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
        let queryStatementString = "SELECT id, district_name FROM districts"
        var queryStatement: OpaquePointer? = nil
        var districts: [District] = []
        
        if sqlite3_prepare_v2(database, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, 0)
                let name = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                districts.append(District(name: name, id: Int(id)))
            }
        } else {
            print("SELECT statement could not be completed")
        }
//        print("Districts: \(districts[0].name), \(districts[1].name)")
        sqlite3_finalize(queryStatement)
        return districts
    }
    
    func readCounties(id: Int) -> [County] {
        let queryStatementString = "SELECT id, local_district_name, district_id FROM local_districts WHERE district_id = \(id)"
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
        
        //For debug
        for i in counties {
            print(i.name)
        }
        
        sqlite3_finalize(queryStatement)
        return counties
    }
    
    
    
    
    
    
    
    
}
