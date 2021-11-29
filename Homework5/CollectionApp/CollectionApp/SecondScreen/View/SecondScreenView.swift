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
        setupImageContainer()
        setupImageView()
        setupDescriptionTextView()
        setupHistoryButton()
    }
    
    func setHeroImage(hero: SuperHero) {
        imageView.image = UIImage(named: hero.image)
    }

    func setHeroDescription(hero: SuperHero) {
        descriptionTextView.text = hero.description
    }

    @objc private func showHistoryVC() {
        self.onTouchedHandler?()
    }
}

// MARK: - Private Methods

private extension SecondScreenView {
    // MARK: - setupHistoryButton
    
    private func setupHistoryButton() {
        historyButton.translatesAutoresizingMaskIntoConstraints = false
        historyButton.setTitle("HERO'S HISTORY", for: .normal)
        historyButton.backgroundColor = .red
        historyButton.setTitleColor(.white, for: .normal)
        historyButton.addTarget(self, action: #selector(showHistoryVC), for: .touchUpInside)
        self.addSubview(historyButton)

        NSLayoutConstraint.activate([
            historyButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: DescriptionConstants.historyButtonBottomAnchorConstant),
            historyButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: DescriptionConstants.historyButtonLeadingAnchorConstant),
            historyButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: DescriptionConstants.historyButtonTrailingAnchorConstant)
        ])
    }
    
    // MARK: - setupDescriptionTextView
    
    private func setupDescriptionTextView() {
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.font = UIFont.systemFont(ofSize: DescriptionConstants.descriptionTextViewFontSize)
        descriptionTextView.textColor = .black
        descriptionTextView.isEditable = false
        descriptionTextView.isSelectable = false
        self.addSubview(descriptionTextView)

        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: DescriptionConstants.descriptionTextViewTopAnchorConstant),
            descriptionTextView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: DescriptionConstants.descriptionTextViewLeadingAnchorConstant),
            descriptionTextView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: DescriptionConstants.descriptionTextViewTrailingAnchorConstant),
            descriptionTextView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * DescriptionConstants.descriptionTextViewHeightAnchorMultiplier)
        ])
    }
    
    // MARK: - setupImageView
    
    private func setupImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.white
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: imageContainer.topAnchor, constant: DescriptionConstants.imageViewTopAnchorConstant),
            imageView.centerXAnchor.constraint(equalTo: imageContainer.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: imageContainer.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * DescriptionConstants.imageViewWidthAnchorMultiplier)
        ])
    }
    
    // MARK: - imageContainer
    
    private func setupImageContainer() {
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        imageContainer.backgroundColor = .white
        self.addSubview(imageContainer)
        imageContainer.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageContainer.topAnchor.constraint(equalTo: self.topAnchor),
            imageContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageContainer.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: DescriptionConstants.imageContainerHeightAnchorMultiplier)
        ])
    }
}
