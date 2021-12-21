//
//  TableViewDataSource.swift
//  CarPricer
//
//  Created by Sergey Golovin on 05.12.2021.
//

import UIKit

final class TableViewDataSource: NSObject {
    
// MARK: - Comnstatnts
    
    private enum Constants {
        static let customLightGreenColor = UIColor.init(red: 75/255, green: 148/255, blue: 96/255, alpha: 1)
        static let customDarkGreenColor = UIColor.init(red: 93/255, green: 176/255, blue: 117/255, alpha: 1)
    }
    
    let carModel: CarModel
    
// MARK: - Initialization
    
    init(carModel: CarModel) {
        self.carModel = carModel
    }
}

// MARK: - UITableViewDataSource Methods

extension TableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        carModel.getCars().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CarTableViewCell.identifier, for: indexPath) as! CarTableViewCell
        cell.configureCell(with: carModel.getModels()[indexPath.row])
        if indexPath.row % 2 == 0 {
            let color = Constants.customDarkGreenColor
            cell.imageView?.backgroundColor = color
            cell.imageView?.tintColor = color
        } else {
            let color = Constants.customLightGreenColor
            cell.imageView?.backgroundColor = color
            cell.imageView?.tintColor = color
        }

        return cell
    }
}
