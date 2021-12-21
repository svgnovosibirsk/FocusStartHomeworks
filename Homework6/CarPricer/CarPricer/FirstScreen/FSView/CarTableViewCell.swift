//
//  CarTableViewCell.swift
//  CarPricer
//
//  Created by Sergey Golovin on 05.12.2021.
//

import UIKit

final class CarTableViewCell: UITableViewCell {
    
// MARK: - Constants
    
    private enum Constants {
        static let greenColor = UIColor.init(red: 93/255, green: 176/255, blue: 117/255, alpha: 1)
        static let imageViewCornerRadius: CGFloat = 12
    }
    
    static let identifier = "CarTableViewCell"

// MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Methods
    
    func configureCell(with car: String) {
        self.imageView?.image = UIImage(systemName: "circle")
        self.imageView?.backgroundColor = Constants.greenColor
        self.imageView?.tintColor = Constants.greenColor
        
        self.imageView?.layer.cornerRadius = Constants.imageViewCornerRadius
        self.imageView?.clipsToBounds = true
        self.textLabel?.text = car
        self.detailTextLabel?.text = "Select"
        self.detailTextLabel?.textColor = .black
    }
}
