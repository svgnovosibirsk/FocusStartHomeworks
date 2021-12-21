//
//  SecondScreenTableViewCell.swift
//  CarPricer
//
//  Created by Sergey Golovin on 06.12.2021.
//

import UIKit

class SecondScreenTableViewCell: UITableViewCell {
    
// MARK: - Properties
    
    static let identifier = "SecondScreenTableViewCell"
    
    var circleImageView = UIImageView()
    var isSelect = false {
        didSet{
            self.configureCircleImageView()
        }
    }
    
    var bodyType: String? {
        didSet {
            guard let bodyType = bodyType else { return }
            self.textLabel?.text = bodyType
        }
    }
    
// MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)

        self.configureCircleImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Methods

private extension SecondScreenTableViewCell {
    private func configureCircleImageView() {
        self.circleImageView.translatesAutoresizingMaskIntoConstraints = false
        self.circleImageView.tintColor = UIColor.init(red: 93/255, green: 176/255, blue: 117/255, alpha: 1)
        self.circleImageView.image = self.isSelect ? UIImage(systemName: "circle.fill") : UIImage(systemName: "circle") // test
        
        self.addSubview(circleImageView)
        
        NSLayoutConstraint.activate([
            self.circleImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.circleImageView.heightAnchor.constraint(equalToConstant: 26),
            self.circleImageView.widthAnchor.constraint(equalToConstant: 26),
            self.circleImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
