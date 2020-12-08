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
        let houseId = housesArray[indexPath.row].id
        photosArray = databaseManager.readHousePhotos(id: houseId)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? HouseUICollectionViewCell else { return UICollectionViewCell() }
        let number = housesArray[indexPath.row].houseNumber
        
        photosArray = databaseManager.readHousePhotos(id: houseId)
        
        cell.houseName?.text = "Дом № \(number)"
        if !photosArray.isEmpty {
            cell.houseImage?.image = photosArray[0]
        } else {
            cell.houseImage?.image = UIImage(named: "nodata")
        }
        
        return cell
    }
    
    //MARK: - Delegate
    override func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let configuration = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { (actions) -> UIMenu? in
            let photo = UIAction(title: "Фотографии", image: UIImage(systemName: "photo.fill"), attributes: [], state: .off) { (action) in
                guard let destination = self.storyboard?.instantiateViewController(identifier: "HousePhotosCollectionViewController") as? HousePhotosCollectionViewController else { return }
                let houseId = self.housesArray[indexPath.row].id
                destination.id = houseId
                self.show(destination, sender: nil)
            }
            
            let supporters = UIAction(title: "Актив и сторонники", image: UIImage(systemName: "person.2"), attributes: [], state: .off) { (action) in
                guard let destination = self.storyboard?.instantiateViewController(identifier: "SupportersTableViewController") as? SupportersTableViewController else { return }
//                destination.supportersArray = self.housesArray[indexPath.row].supporters
                self.show(destination, sender: nil)
            }
            
            let performedImprovements = UIAction(title: "Произведенные работы по благоустройству", image: UIImage(systemName: "archivebox.fill"), attributes: [], state: .off) { (action) in
                guard let destination = self.storyboard?.instantiateViewController(identifier: "PerformedImprovementsTableViewController") as? PerformedImprovementsTableViewController else { return }
//                destination.improvementsArray = self.housesArray[indexPath.row].performedImprovements
                self.show(destination, sender: nil)
            }
            
            let plannedImprovements = UIAction(title: "Запланированные работы по благоустройству", image: UIImage(systemName: "doc.fill"), attributes: [], state: .off) { (action) in
                guard let destination = self.storyboard?.instantiateViewController(identifier: "PlannedImprovementsTableViewController") as? PlannedImprovementsTableViewController else { return }
//                destination.improvementsArray = self.housesArray[indexPath.row].plannedImprovements
                self.show(destination, sender: nil)
            }
            
            return UIMenu(title: "Меню", options: [], children: [photo, supporters, performedImprovements, plannedImprovements])
        }
        return configuration
    }
}
