//
//  SSTableViewDataSource.swift
//  CarPricer
//
//  Created by Sergey Golovin on 09.12.2021.
//

import UIKit

final class SSTableViewDataSource: NSObject {
    
    let carModel: CarModel
    
// MARK: - Initialization
    
    init(carModel: CarModel) {
        self.carModel = carModel
    }
}

// MARK: - UITableViewDataSource Methods

extension SSTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BodyType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SecondScreenTableViewCell.identifier, for: indexPath) as? SecondScreenTableViewCell
        guard let cell = cell else {return UITableViewCell()}
        if indexPath.row == 0 {
            cell.isSelect = true
        }
        let bodyT = carModel.getBodyTypes()
        cell.bodyType = bodyT[indexPath.row]
        return cell
    }
}
