//
//  FirebaseManager.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 10.12.2020.
//

import UIKit
import FirebaseStorage

class StorageManager {
    static let shared = StorageManager()
    private init() {}
    
    static let storage = Storage.storage()
    let storageReference = storage.reference(forURL: "gs://municipal-deputy-app.appspot.com")
    
    func downloadSinglePhoto(imagePath: String, completion: @escaping (UIImage) -> Void){
        let imageRef = storageReference.child(imagePath)
        imageRef.getData(maxSize: 1*1024*1024) { (data, error) in
            if let error = error {
                print(error)
            } else {
                guard let data = data, let image = UIImage(data: data) else { return }
                completion(image)
            }
        }
    }
    
    func downloadPhotosPaths(path: String, completion: @escaping ([String]) -> Void){
        let dispatchGroup = DispatchGroup()
        
        let folderRef = storageReference.child(path)
        print(folderRef.fullPath)
        var imageNamesArray: [String] = []
        
        folderRef.listAll { (result, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Prefixes: \(result.prefixes)")
                print("Items: \(result.items)")
                for item in result.items {
                    print("Path: \(path)")
                    print("Item: \(item)")
                    imageNamesArray.append(item.fullPath)
                }
                print("Names array: \(imageNamesArray)")
            }
            completion(imageNamesArray)
        }
    }
}

extension StorageManager: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}
