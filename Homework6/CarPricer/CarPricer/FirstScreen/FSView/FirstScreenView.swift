//
//  FirstScreenView.swift
//  CarPricer
//
//  Created by Sergey Golovin on 05.12.2021.
//

import UIKit

final class FirstScreenView: UIView {
    
// MARK: - Constants
    
    private enum Constants {
        static let chooseLblFontSize: CGFloat = 30
        static let chooseLblTopAnchorConstant: CGFloat = 60
        static let carBrandLblFontSize: CGFloat = 24
        static let carBrandLblLeadingAnchorConstant: CGFloat = 16
        static let carBrandLblTrailingAnchorConstant: CGFloat = -16
        static let carBrandLblTopAnchorConstant: CGFloat = 43
        static let tableViewRowHeight: CGFloat = 50
        static let tableViewTopAnchorConstant: CGFloat = 20
        static let tableViewBottomAnchorConstant: CGFloat = -20
    }
    
// MARK: - Properties
    
    var onTouchedHandler: (() -> Void)?
    
    let chooseLbl = UILabel()
    let carBrandLbl = UILabel()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(CarTableViewCell.self, forCellReuseIdentifier: CarTableViewCell.identifier)

        return tableView
    }()
    
// MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureViews()
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - FirstScreenViewProtocol

extension FirstScreenView: FirstScreenViewProtocol {
    func setDelegate(delegate: UITableViewDelegate) {
        self.tableView.delegate = delegate
    }
    
    func setDataSource(dataSource: UITableViewDataSource) {
        self.tableView.dataSource = dataSource
    }
}

// MARK: - Private Methods

private extension FirstScreenView {
    private func configureViews() {
        self.configureChooseLbl()
        self.configureCarBrandLbl()
        self.configureTableView()
    }
    
    private func configureChooseLbl() {
        self.chooseLbl.translatesAutoresizingMaskIntoConstraints = false
        self.chooseLbl.text = "Выберите"
        self.chooseLbl.font = UIFont.systemFont(ofSize: Constants.chooseLblFontSize,
                                                weight: .semibold)
        self.addSubview(self.chooseLbl)
        
        NSLayoutConstraint.activate([
            self.chooseLbl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.chooseLbl.topAnchor.constraint(equalTo: self.topAnchor,
                                                constant: Constants.chooseLblTopAnchorConstant)
        ])
    }
    
    private func configureCarBrandLbl() {
        self.carBrandLbl.translatesAutoresizingMaskIntoConstraints = false
        self.carBrandLbl.text = "Марку машины"
        self.carBrandLbl.font = UIFont.systemFont(ofSize: Constants.carBrandLblFontSize,
                                                  weight: .medium)
        self.addSubview(self.carBrandLbl)
        
        NSLayoutConstraint.activate([
            self.carBrandLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                      constant: Constants.carBrandLblLeadingAnchorConstant),
            self.carBrandLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                       constant: Constants.carBrandLblTrailingAnchorConstant),
            self.carBrandLbl.topAnchor.constraint(equalTo: self.chooseLbl.bottomAnchor,
                                                  constant: Constants.carBrandLblTopAnchorConstant)
        ])
    }
    
    private func configureTableView() {
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.rowHeight = Constants.tableViewRowHeight
        self.addSubview(self.tableView)
        
        NSLayoutConstraint.activate([
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.carBrandLbl.bottomAnchor,
                                                constant: Constants.tableViewTopAnchorConstant),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                                   constant: Constants.tableViewBottomAnchorConstant)
        ])
    }

    private func onTouched() {
        self.onTouchedHandler?()
    }
}
