//
//  StreetsHousesCollectionViewController+Delegate+DataSource.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 26.11.2020.
//

import UIKit

extension StreetsHousesCollectionViewController {
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return housesArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let house = housesArray[indexPath.row]
        //        let houseId = house.id
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? HouseUICollectionViewCell else { return UICollectionViewCell() }
        let name = house.name
        cell.houseName?.text = "Дом №\(name)"
        DispatchQueue.global(qos: .userInitiated).async {
            self.storage.downloadPhotosPaths(path: house.imagePath) { (paths) in
                if paths.first == nil {
                    cell.houseImage?.image = UIImage(named: "nodata")
                } else {
                    self.storage.downloadSinglePhoto(imagePath: paths.first!) { (image) in
                        cell.houseImage?.image = image
                    }
                }
            }
        }
        
        return cell
    }
    
    //MARK: - Delegate
    override func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let configuration = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { (actions) -> UIMenu? in
            
            let photo = UIAction(title: "Фотографии", image: UIImage(systemName: "photo.fill"), attributes: [], state: .off) { (action) in
                guard let destination = self.storyboard?.instantiateViewController(identifier: "HousePhotosCollectionViewController") as? HousePhotosCollectionViewController else { return }
                let house = self.housesArray[indexPath.row]
                let houseId = house.id
//                let imageFolder = self.housesArray[indexPath.row].imageFolder
                
                
                destination.districtId = self.districtId
                destination.countyId = self.countyId
                destination.streetId = self.streetId
                destination.houseId = houseId
                destination.imageFolderPath = house.imagePath
                
                self.show(destination, sender: nil)
            }
            
            let supporters = UIAction(title: "Актив и сторонники", image: UIImage(systemName: "person.2"), attributes: [], state: .off) { (action) in
                guard let destination = self.storyboard?.instantiateViewController(identifier: "SupportersTableViewController") as? SupportersTableViewController else { return }
                let houseId = self.housesArray[indexPath.row].id
                DispatchQueue.global().async {
                    destination.districtId = self.districtId
                    destination.countyId = self.countyId
                    destination.streetId = self.streetId
                    destination.houseId = houseId
                    DispatchQueue.main.async {
                        self.show(destination, sender: nil)
                    }
                }
            }
            
            let performedImprovements = UIAction(title: "Произведенные работы по благоустройству", image: UIImage(systemName: "archivebox.fill"), attributes: [], state: .off) { (action) in
                guard let destination = self.storyboard?.instantiateViewController(identifier: "PerformedImprovementsTableViewController") as? PerformedImprovementsTableViewController else { return }
                
                let houseId = self.housesArray[indexPath.row].id
                DispatchQueue.global().async {
                    destination.districtId = self.districtId
                    destination.countyId = self.countyId
                    destination.streetId = self.streetId
                    destination.houseId = houseId
                    DispatchQueue.main.async {
                        self.show(destination, sender: nil)
                        
                    }
                }
            }
            
            let plannedImprovements = UIAction(title: "Запланированные работы по благоустройству", image: UIImage(systemName: "doc.fill"), attributes: [], state: .off) { (action) in
                guard let destination = self.storyboard?.instantiateViewController(identifier: "PlannedImprovementsTableViewController") as? PlannedImprovementsTableViewController else { return }
                
                let houseId = self.housesArray[indexPath.row].id
                DispatchQueue.global().async {
                    destination.districtId = self.districtId
                    destination.countyId = self.countyId
                    destination.streetId = self.streetId
                    destination.houseId = houseId
                    DispatchQueue.main.async {
                        self.show(destination, sender: nil)
                        
                    }
                }
            }
            
            return UIMenu(title: "Меню", options: [], children: [photo, supporters, performedImprovements, plannedImprovements])
        }
        return configuration
    }
}
