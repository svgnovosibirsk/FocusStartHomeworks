//
//  FlowLayout.swift
//  TableViewApp1
//
//  Created by Sergey Golovin on 18.11.2021.
//

import UIKit

final class FlowLayout: UICollectionViewFlowLayout {
    private enum layoutConstants {
        static let portraitWidthDivider: CGFloat = 2
        static let landscapeWidthDivider: CGFloat = 3
        static let landscapeCellWidthAddition = 1
        static let sectionInsetTopMultiplier: CGFloat = 2
        static let sectionInsetBottom: CGFloat = 0
    }
    
    override func prepare() {
        super.prepare()
        
        guard let cv = self.collectionView else { return }

        let availableWidth = cv.bounds.inset(by: cv.layoutMargins).size.width

        let screen = UIScreen.main.bounds

        let minColumnWidth = (screen.height > screen.width) ? availableWidth / layoutConstants.portraitWidthDivider : availableWidth / layoutConstants.landscapeWidthDivider
        let maxNumColumns = Int(availableWidth / minColumnWidth)
        let cellWidth = (screen.height > screen.width) ? (availableWidth / CGFloat(maxNumColumns)).rounded(.down) : (availableWidth / CGFloat(maxNumColumns + layoutConstants.landscapeCellWidthAddition)).rounded(.down)

        self.itemSize = CGSize(width: cellWidth, height: cellWidth)

        self.sectionInset = UIEdgeInsets(top: self.minimumInteritemSpacing * layoutConstants.sectionInsetTopMultiplier, left: self.minimumInteritemSpacing, bottom: layoutConstants.sectionInsetBottom, right: self.minimumInteritemSpacing)
        self.sectionInsetReference = .fromSafeArea
    }
}
