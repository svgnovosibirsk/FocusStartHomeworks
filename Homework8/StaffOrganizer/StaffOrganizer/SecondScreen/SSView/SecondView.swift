//
//  SecondView.swift
//  StaffOrganizer
//
//  Created by Sergey Golovin on 17.12.2021.
//

import UIKit

class SecondView: UIView {
    // MARK: - Constants
    private enum Constants {
        static let tableViewTop: CGFloat = 20
        static let tableViewLeading: CGFloat = 10
        static let tableViewTrailing: CGFloat = -10
        static let tableViewBottom: CGFloat = -20
    }
    
    // MARK: - Properties
    private weak var controller: ISecondViewController?
    
    private let tableView = UITableView()
}

    // MARK: - IFirstView
extension SecondView: ISecondView {
    
    func loadView(controller: ISecondViewController) {
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
private extension SecondView {
    func configTableView() {
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(EmployeeTableViewCell.self, forCellReuseIdentifier: EmployeeTableViewCell.identifier)
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
extension SecondView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        controller?.editEmploee(at: indexPath.row, isEditMode: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            controller?.deleteEmploee(at: indexPath.row)
        }
    }
}

    // MARK: - UITableViewDataSource
extension SecondView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.controller?.getEmploees().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.identifier, for: indexPath) as! EmployeeTableViewCell
        if let emploees = controller?.getEmploees() {
            guard let name = emploees[indexPath.row].name else {return UITableViewCell()}
            let age = String(emploees[indexPath.row].age)
            let exp = String(emploees[indexPath.row].experience)
            cell.textLabel?.text = name + " " + age
            cell.detailTextLabel?.text =  "Exp: " + exp
        }
        return cell
    }
}
