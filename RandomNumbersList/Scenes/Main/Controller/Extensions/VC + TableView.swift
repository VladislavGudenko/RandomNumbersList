//
//  VC + TableView.swift
//  RandomNumbersList
//
//  Created by Владислав Гуденко on 04.03.2024.
//

import Foundation
import UIKit

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VerticalCell", for: indexPath) as! VerticalTableViewCell
        let rowData = data[indexPath.row]
        cell.setData(data: rowData,
                     tableIndexPath: indexPath,
                     collectionIndexPath: scrollsPosition[indexPath.row],
                     srollPosDelegate: self)
        
        return cell
    }
}
