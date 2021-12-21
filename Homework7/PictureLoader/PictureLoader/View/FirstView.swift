//
//  FirstView.swift
//  PictureLoader
//
//  Created by Sergey Golovin on 12.12.2021.
//

import UIKit

final class FirstView: UIView {
    // MARK: - Constants
    private enum Constants {
        static let searchBarTop: CGFloat = 20
        static let searchBarLeading: CGFloat = 10
        static let searchBarTrailing: CGFloat = -10
        
        static let tableViewRowHeight: CGFloat = 150
        static let tableViewTop: CGFloat = 20
        static let tableViewLeading: CGFloat = 10
        static let tableViewTrailing: CGFloat = -10
        static let tableViewBottom: CGFloat = -20
        
        static let progressLabelFont: CGFloat = 20
        static let progressLabelLeading: CGFloat = 10
        static let progressLabelTrailing: CGFloat = -10
        static let progressLabelBottom: CGFloat = -20
        
        static let progressBarlLeading: CGFloat = 10
        static let progressBarlTrailing: CGFloat = -10
        static let progressBArlBottom: CGFloat = -20
        
        static let imageViewCornerRadius: CGFloat = 20
    }
    
    // MARK: - Properties
    private weak var controller: FirstViewController?
    
    private let searchBar = UISearchBar()
    private let tableView = UITableView()
    private let progressLabel = UILabel()
    private let progressBar = UIProgressView()
}

    // MARK: - Public Methods
extension FirstView {
    func loadView(controller: FirstViewController) {
        self.controller = controller
    }
    
    func configureView() {
        self.backgroundColor = .white
        self.configureSearchBar()
        self.configureProgressBar()
        self.configureProgressLabel()
        self.configureTableView()
    }
    
    func update() {
        self.tableView.reloadData()
    }
    
    func updateProgress(with ammount: Float) {
        DispatchQueue.main.async {
            self.progressBar.progress = ammount
            let progress = (Int(ammount * 100))
            if progress >= 0 && progress <= 100 {
                self.progressLabel.text = "\(progress)%"
            }
        }
    }
}

    // MARK: - Private Methods
private extension FirstView {
    func configureSearchBar() {
        self.searchBar.translatesAutoresizingMaskIntoConstraints = false
        self.searchBar.delegate = self
        self.searchBar.placeholder = "Enter image URL"
        self.addSubview(self.searchBar)
        
        NSLayoutConstraint.activate([
            self.searchBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
                                                constant: Constants.searchBarTop),
            self.searchBar.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                                                    constant: Constants.searchBarLeading),
            self.searchBar.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                                                     constant: Constants.searchBarTrailing)
        ])
    }
    
    func configureTableView() {
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.dataSource = self
        self.tableView.rowHeight = Constants.tableViewRowHeight
        
        self.tableView.register(PictureTableViewCell.self, forCellReuseIdentifier: PictureTableViewCell.identifier)
        
        self.addSubview(self.tableView)
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor,
                                                constant: Constants.tableViewTop),
            self.tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                                                    constant: Constants.tableViewLeading),
            self.tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                                                     constant: Constants.tableViewTrailing),
            self.tableView.bottomAnchor.constraint(equalTo: self.progressLabel.topAnchor,
                                                   constant: Constants.tableViewBottom)
        ])
    }
    
    func configureProgressLabel() {
        self.progressLabel.translatesAutoresizingMaskIntoConstraints = false
        self.progressLabel.font = UIFont.systemFont(ofSize: Constants.progressLabelFont)
        self.progressLabel.textAlignment = .center
        self.progressLabel.text = "0%"
        self.addSubview(progressLabel)
        
        NSLayoutConstraint.activate([
            self.progressLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                                                        constant: Constants.progressLabelLeading),
            self.progressLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                                                         constant: Constants.progressLabelTrailing),
            self.progressLabel.bottomAnchor.constraint(equalTo: self.progressBar.bottomAnchor,
                                                       constant: Constants.progressLabelBottom)
        ])
    }
    
    func configureProgressBar() {
        self.progressBar.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(progressBar)
        
        NSLayoutConstraint.activate([
            self.progressBar.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                                                      constant: Constants.progressBarlLeading),
            self.progressBar.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                                                       constant: Constants.progressBarlTrailing),
            self.progressBar.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,
                                                     constant: Constants.progressBArlBottom)
        ])
    }
}

    // MARK: - UITableViewDataSource
extension FirstView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.controller?.images.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PictureTableViewCell.identifier,
                                                 for: indexPath)
        cell.imageView?.layer.cornerRadius = Constants.imageViewCornerRadius
        cell.imageView?.clipsToBounds = true
        cell.imageView?.image = self.controller?.images[indexPath.row]
       
        return cell
    }
    
}

    // MARK: - UISearchBarDelegate
extension FirstView: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let stringUrl = searchBar.text {
            self.controller?.getImage(for: stringUrl)
        }
    }
}
