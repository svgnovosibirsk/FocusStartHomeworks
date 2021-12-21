//
//  SSTableViewDelegate.swift
//  CarPricer
//
//  Created by Sergey Golovin on 09.12.2021.
//

import UIKit

final class SSTableViewDelegate: NSObject {
    var onTouchedHandler: (() -> Void)?
    var onDidSelectRowAt: ((_ : Int) -> Void)?
    
    let carModel: CarModel
    
// MARK: - Initialization
    
    init(carModel: CarModel) {
        self.carModel = carModel
    }
}

// MARK: - UITableViewDelegate Methods

extension SSTableViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //setCarImage(index: indexPath.row)
        onDidSelectRowAt?(indexPath.row) // test
      
        
        CarModel.car?.bodyType = BodyType(rawValue: indexPath.row)! // test
        
        self.deselectAllCells(in: tableView)

        let cell = tableView.cellForRow(at: indexPath) as? SecondScreenTableViewCell
        cell?.isSelect = true
    }
}

// MARK: - Private Methods

private extension SSTableViewDelegate {
    private func deselectAllCells(in tableView: UITableView) {
        var cells: [SecondScreenTableViewCell] = []
        for i in 0...tableView.numberOfSections-1
        {
            for j in 0...tableView.numberOfRows(inSection: i ) - 1
            {
                if let cell = tableView.cellForRow(at: NSIndexPath(row: j, section: i) as IndexPath) as? SecondScreenTableViewCell {
                    cells.append(cell )
                }
            }
        }
        
        for item in cells {
            item.isSelect = false
        }
    }
}
