//
//  ScrollPositionDelegate.swift
//  RandomNumbersList
//
//  Created by Владислав Гуденко on 01.03.2024.
//

import Foundation

// нужен для сохранения стейта проскролленой коллекции, в тз нет, но так эстетичнее и логичнее
protocol ScroolPosDelegate: AnyObject {
    
    func updateScrollPos(tableIndexPath: IndexPath, collectionIndexPath: IndexPath)
}
