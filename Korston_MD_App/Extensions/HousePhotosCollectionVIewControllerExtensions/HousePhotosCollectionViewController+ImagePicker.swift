//
//  HousePhotosCollectionViewController+ImagePicker.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 24.12.2020.
//

import UIKit

extension HousePhotosCollectionViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard
            let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage,
            let imageData = image.jpegData(compressionQuality: 0.3) else
        { return }
        
        storage.uploadPhotoToStorage(path: imageFolderPath, data: imageData)
        self.collectionView.reloadData()
    } 
}
