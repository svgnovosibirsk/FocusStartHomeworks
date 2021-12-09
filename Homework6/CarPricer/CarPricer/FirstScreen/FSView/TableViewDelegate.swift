//
//  TableViewDelegate.swift
//  CarPricer
//
//  Created by Sergey Golovin on 06.12.2021.
//

import UIKit

final class TableViewDelegate: NSObject {
    var onTouchedHandler: (() -> Void)?
    
    let carModel: CarModel
    
// MARK: - Initialization
    
    init(carModel: CarModel) {
        self.carModel = carModel
    }
}

// MARK: - UITableViewDelegate Methods

extension TableViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        CarModel.selectedCarIndex = indexPath.row
        carModel.instantiateCar(index: indexPath.row)
        self.onTouchedHandler?()
    }
}
