//
//  DescriptionViewController.swift
//  TableViewApp1
//
//  Created by Sergey Golovin on 19.11.2021.
//

import UIKit

final class DescriptionViewController: UIViewController {
    
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
    
    var hero: SuperHero?
    
    let imageView = UIImageView()
    let descriptionTextView = UITextView()
    let historyButton = UIButton()
    let imageContainer = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpDescriptionViewController()
        navigationController?.navigationBar.topItem?.title = " "
        navigationController?.navigationBar.tintColor = UIColor.red
    }
    
    private func setUpDescriptionViewController() {
        self.view.backgroundColor = .white
        setupImageContainer()
        setupImageView()
        setupDescriptionTextView()
        setupHistoryButton()
    }
    
    // MARK: - imageContainer
    private func setupImageContainer() {
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        imageContainer.backgroundColor = .white
        view.addSubview(imageContainer)
        imageContainer.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageContainer.topAnchor.constraint(equalTo: view.topAnchor),
            imageContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: DescriptionConstants.imageContainerHeightAnchorMultiplier)
        ])
    }
    
    // MARK: - setupImageView
    private func setupImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.white
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        if let hero = hero {
            imageView.image = UIImage(named: hero.image)
        }
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: imageContainer.topAnchor, constant: DescriptionConstants.imageViewTopAnchorConstant),
            imageView.centerXAnchor.constraint(equalTo: imageContainer.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: imageContainer.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * DescriptionConstants.imageViewWidthAnchorMultiplier)
        ])
    }
    
    // MARK: - setupDescriptionTextView
    private func setupDescriptionTextView() {
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.font = UIFont.systemFont(ofSize: DescriptionConstants.descriptionTextViewFontSize)
        descriptionTextView.textColor = .black
        descriptionTextView.text = hero?.description
        descriptionTextView.isEditable = false
        descriptionTextView.isSelectable = false
        view.addSubview(descriptionTextView)
        
        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: DescriptionConstants.descriptionTextViewTopAnchorConstant),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: DescriptionConstants.descriptionTextViewLeadingAnchorConstant),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: DescriptionConstants.descriptionTextViewTrailingAnchorConstant),
            descriptionTextView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * DescriptionConstants.descriptionTextViewHeightAnchorMultiplier)
        ])
    }
    
    // MARK: - setupHistoryButton
    private func setupHistoryButton() {
        historyButton.translatesAutoresizingMaskIntoConstraints = false
        historyButton.setTitle("HERO'S HISTORY", for: .normal)
        historyButton.backgroundColor = .red
        historyButton.setTitleColor(.white, for: .normal)
        historyButton.addTarget(self, action: #selector(showHistoryVC), for: .touchUpInside)
        view.addSubview(historyButton)
        
        NSLayoutConstraint.activate([
            historyButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: DescriptionConstants.historyButtonBottomAnchorConstant),
            historyButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: DescriptionConstants.historyButtonLeadingAnchorConstant),
            historyButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: DescriptionConstants.historyButtonTrailingAnchorConstant)
        ])
    }
    
    @objc func showHistoryVC() {
        let historyVC = HistoryViewController()
        historyVC.hero = self.hero
        present(historyVC, animated: true)
    }

}

