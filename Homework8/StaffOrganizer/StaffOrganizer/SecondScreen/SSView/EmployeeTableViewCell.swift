//
//  EmployeeTableViewCell.swift
//  StaffOrganizer
//
//  Created by Sergey Golovin on 17.12.2021.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    static let identifier = "EmployeeTableViewCell"
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
