//
//  StretchyHeaderLayout.swift
//  StretchyHeaderCollectionView
//
//  Created by SEAN on 2018/12/30.
//  Copyright © 2018 SEAN. All rights reserved.
//

import UIKit

class StretchyHeaderLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        layoutAttributes?.forEach({ (attribute) in
            if attribute.representedElementKind == UICollectionView.elementKindSectionHeader && attribute.indexPath.section == 0 {
                
                guard let collectionView = collectionView else { return }
                let contentOffsetY = collectionView.contentOffset.y
                print(contentOffsetY)
                if contentOffsetY > 0 {
                    return 
                }
                
                let width = collectionView.frame.width
                let height = attribute.frame.height - contentOffsetY
                attribute.frame = CGRect(x: 0, y: contentOffsetY, width: width, height: height)
            }
        })
        
        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

}
