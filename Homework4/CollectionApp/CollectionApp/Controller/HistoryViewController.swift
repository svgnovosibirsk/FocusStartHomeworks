//
//  HistoryViewController.swift
//  TableViewApp1
//
//  Created by Sergey Golovin on 19.11.2021.
//

import UIKit

final class HistoryViewController: UIViewController {
    
    private enum HistoryConstants {
        static let historyContainerHeightAnchorMmultiplier: CGFloat = 0.8
        
        static let historyTextViewTopAnchorConstant: CGFloat = 20
        static let historyTextViewWidthAnchorMultiplyer: CGFloat = 0.9
        static let historyTextViewFontSize: CGFloat = 22
        
        static let backButtonBottomAnchorConstant: CGFloat = -30
        static let backButtonLeadingAnchorConstant: CGFloat = 30
        static let backButtonTrailingAnchorConstant: CGFloat = -30
    }
    
    var hero: SuperHero?
    
    // MARK: - Views
    private let historyTextView = UITextView()
    private let backButton = UIButton()
    private let historyContainer = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupHistoryViewController()
    }
}

private extension HistoryViewController {
    
    private func setupHistoryViewController() {
        setupHistoryContainer()
        setupHistoryTextView()
        setupBackButton()
    }
    
    // MARK: - imageContainer
    private func setupHistoryContainer() {
        historyContainer.translatesAutoresizingMaskIntoConstraints = false
        historyContainer.backgroundColor = .white
        view.addSubview(historyContainer)
        historyContainer.addSubview(historyTextView)
        
        NSLayoutConstraint.activate([
            historyContainer.topAnchor.constraint(equalTo: view.topAnchor),
            historyContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            historyContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            historyContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: HistoryConstants.historyContainerHeightAnchorMmultiplier)
        ])
    }
    
    // MARK: - historyTextView
    private func setupHistoryTextView() {
        historyTextView.translatesAutoresizingMaskIntoConstraints = false
        historyTextView.font = UIFont.systemFont(ofSize: HistoryConstants.historyTextViewFontSize)
        historyTextView.textColor = .black
        historyTextView.text = hero?.history
        historyTextView.backgroundColor = .white
        historyTextView.isEditable = false
        historyTextView.isSelectable = false
        view.addSubview(historyTextView)
        
        NSLayoutConstraint.activate([
            historyTextView.topAnchor.constraint(equalTo: historyContainer.topAnchor, constant: HistoryConstants.historyTextViewTopAnchorConstant),
            historyTextView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * HistoryConstants.historyTextViewWidthAnchorMultiplyer),
            historyTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            historyTextView.centerYAnchor.constraint(equalTo: historyContainer.centerYAnchor)
        ])
    }
    
    private func setupBackButton() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setTitle("BACK", for: .normal)
        backButton.backgroundColor = .red
        backButton.setTitleColor(.white, for: .normal)
        backButton.addTarget(self, action: #selector(backToDescriptionVC), for: .touchUpInside)
        view.addSubview(backButton)
        
        NSLayoutConstraint.activate([
            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: HistoryConstants.backButtonBottomAnchorConstant),
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: HistoryConstants.backButtonLeadingAnchorConstant),
            backButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: HistoryConstants.backButtonTrailingAnchorConstant)
        ])
    }
    
    @objc private func backToDescriptionVC() {
        dismiss(animated: true, completion: nil)
    }
}
