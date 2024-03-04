//
//  VC + ScrollDelegate.swift
//  RandomNumbersList
//
//  Created by Владислав Гуденко on 04.03.2024.
//

import Foundation

// необходим для сохранения стейта скролла, просто сохраняем индекспас коллекции
extension MainViewController: ScroolPosDelegate {
    
    func updateScrollPos(tableIndexPath: IndexPath, collectionIndexPath: IndexPath) {
        scrollsPosition[tableIndexPath.item] = collectionIndexPath
    }
}
