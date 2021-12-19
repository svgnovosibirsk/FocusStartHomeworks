//
//  FirstView.swift
//  StaffOrganizer
//
//  Created by Sergey Golovin on 16.12.2021.
//

import UIKit

class FirstView: UIView {
    // MARK: - Constants
    private enum Constants {
        static let tableViewTop: CGFloat = 20
        static let tableViewLeading: CGFloat = 10
        static let tableViewTrailing: CGFloat = -10
        static let tableViewBottom: CGFloat = -20
    }
    
    // MARK: - Properties
    private weak var controller: IFirstViewController?

    private let tableView = UITableView()
}

    // MARK: - IFirstView
extension FirstView: IFirstView {
    
    func loadView(controller: IFirstViewController) {
        self.controller = controller
    }
    
    func configView() {
        self.configTableView()
    }
    
    func update() {
        self.tableView.reloadData()
    }
}

    // MARK: - Private Methods
private extension FirstView {
    func configTableView() {
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(CompanyTableViewCell.self, forCellReuseIdentifier: CompanyTableViewCell.identifier)
        self.addSubview(self.tableView)
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor,
                                                constant: Constants.tableViewTop),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                    constant: Constants.tableViewLeading),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                     constant: Constants.tableViewTrailing),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                                   constant: Constants.tableViewBottom)
        ])
    }
}

    // MARK: - UITableViewDelegate
extension FirstView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let comp = controller?.getCompanies()[indexPath.row] {
            controller?.moveToSecondVC(with: comp)
        }
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            controller?.deleteCompany(at: indexPath.row)
        }
    }
    
}

    // MARK: - UITableViewDataSource
extension FirstView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.controller?.getCompanies().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CompanyTableViewCell.identifier, for: indexPath) as! CompanyTableViewCell
        if let companies = controller?.getCompanies() {
            cell.textLabel?.text = companies[indexPath.row].name
        }
        return cell
    }
}
