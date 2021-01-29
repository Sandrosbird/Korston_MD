//
//  HousePhotosCollectionViewController+Helpers.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 24.12.2020.
//

import UIKit
//import DropDown

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
        
        let fromMemoryAction = UIAction(title: "Загрузить фото", image: UIImage(systemName: "photo.fill"), attributes: [], state: .off) { (action) in
            imagePickerController.delegate = self
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }

        let fromCameraAction = UIAction(title: "Сделать фото", image: UIImage(systemName: "camera.fill"), attributes: [], state: .off) { (action) in
            imagePickerController.delegate = self
            
            if (!UIImagePickerController.isSourceTypeAvailable(.camera)) {
                let alert = UIAlertController(title: "Внимание!", message: "Камера устройства недоступна!", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "ОК", style: .cancel) { (action) in
                    alert.dismiss(animated: true, completion: nil)
                }
                alert.addAction(cancelAction)
                self.present(alert, animated: true, completion: nil)
                
            }
            else{
                imagePickerController.sourceType = .camera
                imagePickerController.allowsEditing = true
                self.present(imagePickerController, animated: true, completion: nil)
            }
            
        }

        let menu = UIMenu(title: "", image: nil, identifier: nil, options: .displayInline, children: [fromCameraAction, fromMemoryAction])
        
        if #available(iOS 14.0, *) {
            addButtonItem.primaryAction = nil
            addButtonItem.menu = menu
        } else {
            dropDown.dataSource = ["Загрузить фото","Сделать фото"]
            dropDown.cellConfiguration = { (index, item) in return "\(item)" }
            
            dropDown.selectionAction = { (index: Int, item: String) in
                switch index {
                case 0:
                    imagePickerController.delegate = self
                    imagePickerController.sourceType = .photoLibrary
                    self.present(imagePickerController, animated: true, completion: nil)
                case 1:
                    imagePickerController.delegate = self
                    
                    if (!UIImagePickerController.isSourceTypeAvailable(.camera)) {
                        let alert = UIAlertController(title: "Внимание!", message: "Камера устройства недоступна!", preferredStyle: .alert)
                        let cancelAction = UIAlertAction(title: "ОК", style: .cancel) { (action) in
                            alert.dismiss(animated: true, completion: nil)
                        }
                        alert.addAction(cancelAction)
                        self.present(alert, animated: true, completion: nil)
                        
                    }
                    else{
                        imagePickerController.sourceType = .camera
                        imagePickerController.allowsEditing = true
                        self.present(imagePickerController, animated: true, completion: nil)
                    }
                default :
                    return
                }
            }
            
//            present(imagePickerController, animated: true, completion: nil)
            //add popup menu
//            addButtonItem.action
//            imagePickerController.delegate = self
//            imagePickerController.sourceType = .photoLibrary
//            present(imagePickerController, animated: true, completion: nil)
        }
    }
    
    func showDropDown() {
        dropDown.show()
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
