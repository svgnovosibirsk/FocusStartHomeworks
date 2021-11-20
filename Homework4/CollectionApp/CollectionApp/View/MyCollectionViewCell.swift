//
//  MyCollectionViewCell.swift
//  TableViewApp1
//
//  Created by Sergey Golovin on 18.11.2021.
//

import UIKit

final class MyCollectionViewCell: UICollectionViewCell {
    static let identifier = "MyCollectonViewCell"
    
    var hero: SuperHero?
    
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.clipsToBounds = true
        self.autoresizesSubviews = true
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 5
        
        setupCellViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCellViews() {
        setupImageView()
        setupNameLabel()
    }
    
    func configure(with hero: SuperHero) {
        self.imageView.image = UIImage(named: hero.image)
        self.nameLabel.text = hero.name
    }
    
    private func setupImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.white
        //imageView.layer.cornerRadius = 5
        //imageView.layer.borderWidth = 0
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: self.bounds.size.width * 0.75),
            imageView.heightAnchor.constraint(equalToConstant: self.bounds.size.width * 0.75)
        ])
    }
    
    private func setupNameLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = UIColor.black
        nameLabel.font = UIFont.boldSystemFont(ofSize: 15)
        addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 3),
            nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
}
