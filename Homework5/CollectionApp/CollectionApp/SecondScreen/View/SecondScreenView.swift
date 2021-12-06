//
//  SecondScreenView.swift
//  CollectionApp
//
//  Created by Sergey Golovin on 26.11.2021.
//

import UIKit

final class SecondScreenView: UIView {
    
    var onTouchedHandler: (() -> Void)?
    
    // MARK: - Constants
    
    private enum DescriptionConstants {
        static let imageContainerHeightAnchorMultiplier: CGFloat = 0.5
        
        static let imageViewTopAnchorConstant: CGFloat = 10
        static let imageViewWidthAnchorMultiplier: CGFloat = 0.3

        static let descriptionTextViewFontSize: CGFloat = 18
        static let descriptionTextViewTopAnchorConstant: CGFloat = 15
        static let descriptionTextViewLeadingAnchorConstant: CGFloat = 30
        static let descriptionTextViewTrailingAnchorConstant: CGFloat = -30
        static let descriptionTextViewHeightAnchorMultiplier: CGFloat = 0.3

        static let historyButtonBottomAnchorConstant: CGFloat = -10
        static let historyButtonLeadingAnchorConstant: CGFloat = 30
        static let historyButtonTrailingAnchorConstant: CGFloat = -30
    }
    
    // MARK: - Views
    
    private let imageView = UIImageView()
    private let descriptionTextView = UITextView()
    private let historyButton = UIButton()
    private let imageContainer = UIView()
    
    func setUpSecondScreenView() {
        self.backgroundColor = .white
        self.setupImageContainer()
        self.setupImageView()
        self.setupDescriptionTextView()
        self.setupHistoryButton()
    }
    
    func setHeroImage(hero: SuperHero) {
        self.imageView.image = UIImage(named: hero.image)
    }

    func setHeroDescription(hero: SuperHero) {
        self.descriptionTextView.text = hero.description
    }

    @objc private func showHistoryVC() {
        self.onTouchedHandler?()
    }
}

// MARK: - Private Methods

private extension SecondScreenView {
    // MARK: - setupHistoryButton
    
    private func setupHistoryButton() {
        self.historyButton.translatesAutoresizingMaskIntoConstraints = false
        self.historyButton.setTitle("HERO'S HISTORY", for: .normal)
        self.historyButton.backgroundColor = .red
        self.historyButton.setTitleColor(.white, for: .normal)
        self.historyButton.addTarget(self, action: #selector(showHistoryVC), for: .touchUpInside)
        self.addSubview(self.historyButton)

        NSLayoutConstraint.activate([
            self.historyButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: DescriptionConstants.historyButtonBottomAnchorConstant),
            self.historyButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: DescriptionConstants.historyButtonLeadingAnchorConstant),
            self.historyButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: DescriptionConstants.historyButtonTrailingAnchorConstant)
        ])
    }
    
    // MARK: - setupDescriptionTextView
    
    private func setupDescriptionTextView() {
        self.descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        self.descriptionTextView.font = UIFont.systemFont(ofSize: DescriptionConstants.descriptionTextViewFontSize)
        self.descriptionTextView.textColor = .black
        self.descriptionTextView.isEditable = false
        self.descriptionTextView.isSelectable = false
        self.addSubview(self.descriptionTextView)

        NSLayoutConstraint.activate([
            self.descriptionTextView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: DescriptionConstants.descriptionTextViewTopAnchorConstant),
            self.descriptionTextView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: DescriptionConstants.descriptionTextViewLeadingAnchorConstant),
            self.descriptionTextView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: DescriptionConstants.descriptionTextViewTrailingAnchorConstant),
            self.descriptionTextView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * DescriptionConstants.descriptionTextViewHeightAnchorMultiplier)
        ])
    }
    
    // MARK: - setupImageView
    
    private func setupImageView() {
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.backgroundColor = UIColor.white
        self.imageView.layer.borderColor = UIColor.lightGray.cgColor
        self.imageView.clipsToBounds = true
        self.imageView.contentMode = .scaleAspectFit

        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.imageContainer.topAnchor, constant: DescriptionConstants.imageViewTopAnchorConstant),
            self.imageView.centerXAnchor.constraint(equalTo: self.imageContainer.centerXAnchor),
            self.imageView.centerYAnchor.constraint(equalTo: self.imageContainer.centerYAnchor),
            self.imageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * DescriptionConstants.imageViewWidthAnchorMultiplier)
        ])
    }
    
    // MARK: - imageContainer
    
    private func setupImageContainer() {
        self.imageContainer.translatesAutoresizingMaskIntoConstraints = false
        self.imageContainer.backgroundColor = .white
        self.addSubview(imageContainer)
        self.imageContainer.addSubview(self.imageView)
        
        NSLayoutConstraint.activate([
            self.imageContainer.topAnchor.constraint(equalTo: self.topAnchor),
            self.imageContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.imageContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.imageContainer.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: DescriptionConstants.imageContainerHeightAnchorMultiplier)
        ])
    }
}
