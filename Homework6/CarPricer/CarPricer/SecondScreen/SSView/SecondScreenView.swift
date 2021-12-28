//
//  SecondScreenView.swift
//  CarPricer
//
//  Created by Sergey Golovin on 05.12.2021.
//

import UIKit

final class SecondScreenView: UIView {
    
// MARK: - Constants
    
    private enum Constants {
        static let calculateCarPriceDelay: CGFloat = 2
        
        static let carImageViewTop: CGFloat = 76
        static let carImageViewHeight: CGFloat = 196
        static let carImageViewWidth: CGFloat = 340
        
        static let priceTextSize: CGFloat = 24
        static let priceTextLblTop: CGFloat = 23
        static let priceTextLblLeading: CGFloat = 16
        static let priceTextLblTrailing: CGFloat = -16
        
        static let priceValueTextSize: CGFloat = 16
        static let priceValueLblTop: CGFloat = 8
        static let priceValueLblHeight: CGFloat = 19
        static let priceValueLblLeading: CGFloat = 16
        static let priceValueLblTrailing: CGFloat = -16
        
        static let chooseCarBodyTextSize: CGFloat = 24
        static let chooseCarBodyTop: CGFloat = 23
        static let chooseCarBodyLeading: CGFloat = 16
        static let chooseCarBodyTrailing: CGFloat = -16
        
        static let tableViewRowHeight: CGFloat = 50
        static let tableViewTop: CGFloat = 18
        static let tableViewBottom: CGFloat = -12
        
        static let customGreenColor = UIColor.init(red: 75/255, green: 148/255, blue: 96/255, alpha: 1)
        
        static let calculatePriceBtnCornerRadius: CGFloat = 25
        static let calculatePriceBtnLeading: CGFloat = 16
        static let calculatePriceBtnTrailing: CGFloat = -16
        static let calculatePriceBtnBottom: CGFloat = -95
        static let calculatePriceBtnHeight: CGFloat = 50
        
        static let spinnerWidth: CGFloat = 50
        static let spinnerHeight: CGFloat = 50
    }
    
// MARK: - Properties
    
    let carImageView = UIImageView()
    let priceTexLlbl = UILabel()
    let priceValueLbl = UILabel()
    let chooseCarBodyTypeLbl = UILabel()
    let calculatePriceBtn = UIButton()
    let spinner = UIActivityIndicatorView()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(SecondScreenTableViewCell.self,
                           forCellReuseIdentifier: SecondScreenTableViewCell.identifier)
        return tableView
    }()
    
    var onCalculateBtnPressed: (() -> Void)?
    
// MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureViews()
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func calculateCarPrice() {
        self.onCalculateBtnPressed?()
    }
}

// MARK: - SecondScreenViewProtocol

extension SecondScreenView: SecondScreenViewProtocol {
    func setDelegate(delegate: UITableViewDelegate) {
        self.tableView.delegate = delegate
    }
    
    func setDataSource(dataSource: UITableViewDataSource) {
        self.tableView.dataSource = dataSource
    }
    
    func setCarImage(index: Int) {
        let images = ["sedan", "van", "universal", "hatchback"]
        self.carImageView.image = UIImage(named: images[index])
    }
    
    func setPriceLblText(with price: String) {
        self.priceValueLbl.text = price + "$"
    }
    
    func update() {
        self.deselectAllCells(in: tableView)
        self.tableView.reloadData()
    }
    
    func updateCarPrice(by price: String) {
        self.spinner.isHidden = false
        self.spinner.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.calculateCarPriceDelay) {
            self.priceValueLbl.text = String(price) + "$"
            self.spinner.stopAnimating()
        }
    }
}

// MARK: - Private Configuration Methods

private extension SecondScreenView {
 
    private func configureViews() {
        self.configureCarImageView()
        self.configurePriceTexLlbl()
        self.configurePriceValueLbl()
        self.configureChooseCarBodyTypeLbl()
        self.configureCalculatePriceBtn()
        self.configureTableView()
        self.configureSpinner()
    }
    
    private func configureCarImageView() {
        self.carImageView.translatesAutoresizingMaskIntoConstraints = false
        self.carImageView.image = UIImage(named: "sedan")
        self.carImageView.contentMode = .scaleAspectFit
        
        self.addSubview(carImageView)
        
        NSLayoutConstraint.activate([
            self.carImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.carImageViewTop),
            self.carImageView.heightAnchor.constraint(equalToConstant: Constants.carImageViewHeight),
            self.carImageView.widthAnchor.constraint(equalToConstant: Constants.carImageViewWidth),
            self.carImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func configurePriceTexLlbl() {
        self.priceTexLlbl.translatesAutoresizingMaskIntoConstraints = false
        self.priceTexLlbl.text = "Цена"
        self.priceTexLlbl.font = UIFont.systemFont(ofSize: Constants.priceTextSize, weight: .medium)
        self.addSubview(self.priceTexLlbl)
        
        NSLayoutConstraint.activate([
            self.priceTexLlbl.topAnchor.constraint(equalTo: self.carImageView.bottomAnchor, constant: Constants.priceTextLblTop),
            self.priceTexLlbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.priceTextLblLeading),
            self.priceTexLlbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Constants.priceTextLblTrailing)
        ])
    }
    
    private func configurePriceValueLbl() {
        self.priceValueLbl.translatesAutoresizingMaskIntoConstraints = false
        self.priceValueLbl.text = "10000$"
        self.priceValueLbl.font = UIFont.systemFont(ofSize: Constants.priceValueTextSize, weight: .medium)
        self.priceValueLbl.textColor = .black
        self.addSubview(self.priceValueLbl)
        
        NSLayoutConstraint.activate([
            self.priceValueLbl.topAnchor.constraint(equalTo: self.priceTexLlbl.bottomAnchor,
                                                    constant: Constants.priceValueLblTop),
            self.priceValueLbl.heightAnchor.constraint(equalToConstant: Constants.priceValueLblHeight),
            self.priceValueLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                        constant: Constants.priceValueLblLeading),
            self.priceValueLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                         constant: Constants.priceValueLblTrailing)
        ])
    }
    
    private func configureChooseCarBodyTypeLbl() {
        self.chooseCarBodyTypeLbl.translatesAutoresizingMaskIntoConstraints = false
        self.chooseCarBodyTypeLbl.text = "Выберите тип кузова"
        self.chooseCarBodyTypeLbl.font = UIFont.systemFont(ofSize: Constants.chooseCarBodyTextSize, weight: .medium)
        self.addSubview(self.chooseCarBodyTypeLbl)
        
        NSLayoutConstraint.activate([
            self.chooseCarBodyTypeLbl.topAnchor.constraint(equalTo: self.priceValueLbl.bottomAnchor,
                                                           constant: Constants.chooseCarBodyTop),
            self.chooseCarBodyTypeLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                               constant: Constants.chooseCarBodyLeading),
            self.chooseCarBodyTypeLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                                constant: Constants.chooseCarBodyTrailing)
        ])
    }

    private func configureTableView() {
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.rowHeight = Constants.tableViewRowHeight

        self.addSubview(self.tableView)
        
        NSLayoutConstraint.activate([
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.chooseCarBodyTypeLbl.bottomAnchor,
                                                constant: Constants.tableViewTop),
            self.tableView.bottomAnchor.constraint(equalTo: self.calculatePriceBtn.topAnchor,
                                                   constant: Constants.tableViewBottom)
        ])
    }

    private func configureCalculatePriceBtn() {
        self.calculatePriceBtn.translatesAutoresizingMaskIntoConstraints = false
        self.calculatePriceBtn.backgroundColor = Constants.customGreenColor
        self.calculatePriceBtn.setTitleColor(.white, for: .normal)
        self.calculatePriceBtn.setTitle("Рассчитать цену", for: .normal)
        self.calculatePriceBtn.layer.cornerRadius = Constants.calculatePriceBtnCornerRadius
        self.calculatePriceBtn.addTarget(self, action: #selector(calculateCarPrice), for: .touchUpInside)
        
        self.addSubview(self.calculatePriceBtn)
        
        NSLayoutConstraint.activate([
            self.calculatePriceBtn.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                            constant: Constants.calculatePriceBtnLeading),
            self.calculatePriceBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                             constant: Constants.calculatePriceBtnTrailing),
            self.calculatePriceBtn.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                                           constant: Constants.calculatePriceBtnBottom),
            self.calculatePriceBtn.heightAnchor.constraint(equalToConstant: Constants.calculatePriceBtnHeight)
        ])
    }
    
    private func configureSpinner() {
        self.spinner.translatesAutoresizingMaskIntoConstraints = false
        self.spinner.isHidden = true
        self.spinner.style = .large
        self.spinner.color = Constants.customGreenColor
        self.spinner.hidesWhenStopped = true
        

        self.addSubview(self.spinner)

        NSLayoutConstraint.activate([
            self.spinner.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.spinner.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.spinner.widthAnchor.constraint(equalToConstant: Constants.spinnerWidth),
            self.spinner.heightAnchor.constraint(equalToConstant: Constants.spinnerHeight)
        ])
    }
}

// MARK: - Private Methods

private extension SecondScreenView {
    private func deselectAllCells(in tableView: UITableView) {
        var cells: [SecondScreenTableViewCell] = []
        for i in 0...tableView.numberOfSections-1
        {
            for j in 0...tableView.numberOfRows(inSection: i ) - 1
            {
                if let cell = tableView.cellForRow(at: NSIndexPath(row: j, section: i) as IndexPath) as? SecondScreenTableViewCell {
                    cells.append(cell )
                }
            }
        }

        for item in cells {
            item.isSelect = false
        }
    }
}
