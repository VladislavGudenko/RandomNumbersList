//
//  VerticalTable.swift
//  RandomNumbersList
//
//  Created by Владислав Гуденко on 01.03.2024.
//

import Foundation
import UIKit

class VerticalTableViewCell: UITableViewCell {
    
    var horizontalCollectionView: UICollectionView!
    var rowData = [Int]()
    var tableIndexPath: IndexPath?
    weak var scrollPosDelegate: ScroolPosDelegate?

    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        setupHorizontalCollectionView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupHorizontalCollectionView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        rowData = []
        tableIndexPath = nil
        scrollPosDelegate = nil
        horizontalCollectionView.scrollToItem(at: IndexPath(item: 0,
                                                            section: 0),
                                              at: .left,
                                              animated: false)
        horizontalCollectionView.reloadData()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0,
                                                                     left: 0,
                                                                     bottom: 10,
                                                                     right: 0))
        horizontalCollectionView.frame = self.contentView.bounds

    }

    private func setupHorizontalCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        horizontalCollectionView = UICollectionView(frame: bounds,
                                                    collectionViewLayout: layout)
        horizontalCollectionView.showsHorizontalScrollIndicator = false
        horizontalCollectionView.dataSource = self
        horizontalCollectionView.delegate = self
        
        horizontalCollectionView.register(HorizontalCollectionViewCell.self,
                                          forCellWithReuseIdentifier: "HorizontalCell")
        horizontalCollectionView.isPagingEnabled = false

        contentView.addSubview(horizontalCollectionView)
    }

    func setData(data: [Int],
                 tableIndexPath: IndexPath,
                 collectionIndexPath: IndexPath,
                 srollPosDelegate: ScroolPosDelegate?) {
        rowData = data
        self.tableIndexPath = tableIndexPath
        self.scrollPosDelegate = srollPosDelegate
        horizontalCollectionView.scrollToItem(at: collectionIndexPath,
                                              at: .left,
                                              animated: false)
        horizontalCollectionView.reloadData()
    }
}
