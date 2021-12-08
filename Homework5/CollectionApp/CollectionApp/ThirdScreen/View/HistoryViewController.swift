//
//  HistoryViewController.swift
//  TableViewApp1
//
//  Created by Sergey Golovin on 19.11.2021.
//

import UIKit

final class HistoryViewController: UIViewController {
    let viewModel = ViewModel()
    
    // MARK: - Constants
    private enum HistoryConstants {
        static let historyContainerHeightAnchorMmultiplier: CGFloat = 0.8
        
        static let historyTextViewTopAnchorConstant: CGFloat = 20
        static let historyTextViewWidthAnchorMultiplyer: CGFloat = 0.9
        static let historyTextViewFontSize: CGFloat = 22
        
        static let backButtonBottomAnchorConstant: CGFloat = -30
        static let backButtonLeadingAnchorConstant: CGFloat = 30
        static let backButtonTrailingAnchorConstant: CGFloat = -30
    }

    // MARK: - Views
    private let historyTextView = UITextView()
    private let backButton = UIButton()
    private let historyContainer = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        self.setupHistoryViewController()
        self.setTextViewText()
    }
}

// MARK: - Private Methods

private extension HistoryViewController {
    
    private func setTextViewText() {
        self.viewModel.data.setNotify { [weak self] text in
            self?.historyTextView.text = text
        }
    }

    private func setupHistoryViewController() {
        self.setupHistoryContainer()
        self.setupHistoryTextView()
        self.setupBackButton()
    }

    // MARK: - imageContainer
    
    private func setupHistoryContainer() {
        self.historyContainer.translatesAutoresizingMaskIntoConstraints = false
        self.historyContainer.backgroundColor = .white
        view.addSubview(self.historyContainer)
        self.historyContainer.addSubview(self.historyTextView)

        NSLayoutConstraint.activate([
            self.historyContainer.topAnchor.constraint(equalTo: view.topAnchor),
            self.historyContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.historyContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.historyContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: HistoryConstants.historyContainerHeightAnchorMmultiplier)
        ])
    }

    // MARK: - historyTextView
    
    private func setupHistoryTextView() {
        self.historyTextView.translatesAutoresizingMaskIntoConstraints = false
        self.historyTextView.font = UIFont.systemFont(ofSize: HistoryConstants.historyTextViewFontSize)
        self.historyTextView.textColor = .black
        self.historyTextView.backgroundColor = .white
        self.historyTextView.isEditable = false
        self.historyTextView.isSelectable = false
        view.addSubview(self.historyTextView)
        
        NSLayoutConstraint.activate([
            self.historyTextView.topAnchor.constraint(equalTo: historyContainer.topAnchor, constant: HistoryConstants.historyTextViewTopAnchorConstant),
            self.historyTextView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * HistoryConstants.historyTextViewWidthAnchorMultiplyer),
            self.historyTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.historyTextView.centerYAnchor.constraint(equalTo: self.historyContainer.centerYAnchor)
        ])
    }
    
    // MARK: - backButton

    private func setupBackButton() {
        self.backButton.translatesAutoresizingMaskIntoConstraints = false
        self.backButton.setTitle("BACK", for: .normal)
        self.backButton.backgroundColor = .red
        self.backButton.setTitleColor(.white, for: .normal)
        self.backButton.addTarget(self, action: #selector(backToDescriptionVC), for: .touchUpInside)
        view.addSubview(self.backButton)
        
        NSLayoutConstraint.activate([
            self.backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: HistoryConstants.backButtonBottomAnchorConstant),
            self.backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: HistoryConstants.backButtonLeadingAnchorConstant),
            self.backButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: HistoryConstants.backButtonTrailingAnchorConstant)
        ])
    }
    
    @objc private func backToDescriptionVC() {
        dismiss(animated: true, completion: nil)
    }
}
