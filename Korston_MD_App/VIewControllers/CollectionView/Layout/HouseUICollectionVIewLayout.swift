//
//  HouseUICollectionVIewLayout.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 21.11.2020.
//

import UIKit

class HouseUICollectionVIewLayout: UICollectionViewLayout {
    //MARK: - Properties
    var cacheAttributes = [IndexPath: UICollectionViewLayoutAttributes]()
    var cellHeight: CGFloat = 250
    private var totalCellsHeight: CGFloat = 0
    
    override func prepare() {
//        super.prepare()
        self.cacheAttributes = [:]
        guard let collectionView = self.collectionView else { return }
        let itemsCount = collectionView.numberOfItems(inSection: 0)
        guard itemsCount > 0 else { return }
        
        let bigCellWidth = collectionView.frame.width
    
        var lastY: CGFloat = 0
        
        for index in 0 ..< itemsCount {
            let indexPath = IndexPath(item: index, section: 0)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)

            attributes.frame = CGRect(x: 0, y: lastY, width: bigCellWidth, height: self.cellHeight)
            lastY += self.cellHeight
            cacheAttributes[indexPath] = attributes
            self.totalCellsHeight = lastY
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cacheAttributes.values.filter { (attributes) in
            return rect.intersects(attributes.frame)
        }
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: self.collectionView?.frame.width ?? 0, height: self.totalCellsHeight)
    }
}
