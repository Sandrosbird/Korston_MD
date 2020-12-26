//
//  HousePhotosCollectionViewController+Helpers.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 24.12.2020.
//

import UIKit

extension HousePhotosCollectionViewController {
    //MARK: - Helpers
    
    func downloadPhotos() {
        self.storage.downloadPhotosPaths(path: self.imageFolderPath) { (paths) in
//            self.photoPaths = paths
            for path in paths {
                self.storage.downloadSinglePhoto(imagePath: path) { (image) in
                    self.photosArray.append(image)
                }
            }
        }
    }
    
    func setupBarButtonItem() {
        let imagePickerController = UIImagePickerController()
        
        let fromMemoryAction = UIAction(title: "Загрузить фото", image: UIImage(systemName: "camera.fill"), attributes: [], state: .off) { (action) in
            imagePickerController.delegate = self
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }
        
        let fromCameraAction = UIAction(title: "Сделать фото", image: UIImage(systemName: "photo.fill"), attributes: [], state: .off) { (action) in
            imagePickerController.delegate = self
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
        }
        
        let menu = UIMenu(title: "", image: nil, identifier: nil, options: .displayInline, children: [fromCameraAction, fromMemoryAction])
        
        
        if #available(iOS 14.0, *) {
            addButtonItem.primaryAction = nil
            addButtonItem.menu = menu
        } else {
            imagePickerController.delegate = self
            imagePickerController.sourceType = .photoLibrary
            present(imagePickerController, animated: true, completion: nil)
        }
    }
    
    func setupRefreshControl() {
        collectionView.refreshControl = refreshControl
        refreshControl.attributedTitle = NSAttributedString(string: "Pull down to refresh...")
        refreshControl.addTarget(self, action: #selector(refreshCollection(_:)), for: .valueChanged)
    }
    
    @objc func refreshCollection(_ sender: Any) {
        photosArray = []
        downloadPhotos()
        self.collectionView.reloadData()
        refreshControl.endRefreshing()
    }
}
