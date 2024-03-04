//
//  HorizontalCollectionCell.swift
//  RandomNumbersList
//
//  Created by Владислав Гуденко on 01.03.2024.
//

import Foundation
import UIKit

class HorizontalCollectionViewCell: UICollectionViewCell {

    private var valueLabel: UILabel!
    var collectionCellIndexPath: IndexPath?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }
    
    // тут на 20% уменьшаем ячейку при ее зажатии
    override var isHighlighted: Bool {
            didSet {
                if isHighlighted {
                    UIView.animate(withDuration: 0.2) {
                        self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                    }
                } else {
                    UIView.animate(withDuration: 0.2) {
                        self.transform = .identity
                    }
                }
            }
        }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        collectionCellIndexPath = nil
    }

    private func setupSubviews() {
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.cornerRadius = 8
        valueLabel = UILabel()
        valueLabel.textAlignment = .center
        contentView.addSubview(valueLabel)
    }

    func setData(value: Int, collectionCellIndexPath: IndexPath) {
        valueLabel.text = "\(value)"
        self.collectionCellIndexPath = collectionCellIndexPath
    }
    
    func updateRandomValue(_ value: Int) {
        valueLabel.text = "\(value)"
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        valueLabel.frame = bounds
    }
}

