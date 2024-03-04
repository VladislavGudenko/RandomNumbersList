//
//  TableView + ScrollView.swift
//  RandomNumbersList
//
//  Created by Владислав Гуденко on 04.03.2024.
//

import Foundation
import UIKit

extension VerticalTableViewCell: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let visibleCells = horizontalCollectionView.visibleCells as? [HorizontalCollectionViewCell],
              let sortedVisibleCell = visibleCells.sorted(by: { $0.collectionCellIndexPath!.row < $1.collectionCellIndexPath!.row }).first else {
            return
        }
        scrollPosDelegate?.updateScrollPos(tableIndexPath: self.tableIndexPath ?? IndexPath(row: 0,
                                                                                            section: 0),
                                           collectionIndexPath: sortedVisibleCell.collectionCellIndexPath ?? IndexPath(row: 0, section: 0))
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {}
}
