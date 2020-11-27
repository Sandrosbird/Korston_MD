//
//  StreetUICollectionViewLayout.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 18.11.2020.
//

import UIKit

class StreetUICollectionViewLayout: UICollectionViewLayout {
    
    //MARK: - Properties
    var cacheAttributes = [IndexPath: UICollectionViewLayoutAttributes]()
    var columnsCount = 2
    var cellHeight: CGFloat = 150
    private var totalCellsHeight: CGFloat = 0
    
    override func prepare() {
//        super.prepare()
        self.cacheAttributes = [:]
        guard let collectionView = self.collectionView else { return }
        let itemsCount = collectionView.numberOfItems(inSection: 0)
        guard itemsCount > 0 else { return }
        
        let bigCellWidth = collectionView.frame.width
        let smallCellWidth = collectionView.frame.width / CGFloat(self.columnsCount)
        
        var lastX: CGFloat = 0
        var lastY: CGFloat = 0
        
        for index in 0 ..< itemsCount {
            let indexPath = IndexPath(item: index, section: 0)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            let isBigCell = (index + 1) % (self.columnsCount + 1) == 0
            
            if isBigCell {
                attributes.frame = CGRect(x: 0, y: lastY, width: bigCellWidth, height: self.cellHeight)
                lastY += self.cellHeight
            } else {
                attributes.frame = CGRect(x: lastX, y: lastY, width: smallCellWidth, height: self.cellHeight)
                let isLastColumn = (index + 2) % (self.columnsCount + 1) == 0 || index == itemsCount - 1
                
                if isLastColumn {
                    lastX = 0
                    lastY += self.cellHeight
                } else {
                    lastX += smallCellWidth
                }
            }
            cacheAttributes[indexPath] = attributes
            self.totalCellsHeight = lastY
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//        super.layoutAttributesForElements(in: rect)
        
        return cacheAttributes.values.filter { (attributes) in
            return rect.intersects(attributes.frame)
        }
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: self.collectionView?.frame.width ?? 0, height: self.totalCellsHeight)
    }
    
//    override var collectionViewContentSize: CGSize = CGSize.zero
    
}
