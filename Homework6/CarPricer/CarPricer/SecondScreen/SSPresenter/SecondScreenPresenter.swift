//
//  SecondScreenPresenter.swift
//  CarPricer
//
//  Created by Sergey Golovin on 05.12.2021.
//

import UIKit

final class SecondScreenPresenter {
    
// MARK: - Properties
    
    private let model: CarModel
    private weak var controller: SecondScreenViewControllerProtocol?
    private weak var view: SecondScreenViewProtocol?
    private let dataSource: SSTableViewDataSource?
    private let delegate: SSTableViewDelegate?
    
    struct Dependencies {
        let model: CarModelProtocol
        let dataSource: SSTableViewDataSource
        let delegate: SSTableViewDelegate
    }
    
// MARK: - Initialization

    init(dependencies: Dependencies) {
        self.model = dependencies.model as? CarModel ?? CarModel()
        self.dataSource = dependencies.dataSource
        self.delegate = dependencies.delegate
    }
}

// MARK: - SecondScreenPresenterProtocol

extension SecondScreenPresenter: SecondScreenPresenterProtocol {
    func loadView(controller: SecondScreenViewControllerProtocol, view: SecondScreenViewProtocol?) {
        self.controller = controller
        self.view = view
        guard let delegate = delegate,
              let dataSource = dataSource
        else { return }
        self.view?.setDelegate(delegate: delegate)
        self.view?.setDataSource(dataSource: dataSource)
        
        self.setHandlers()
    }
    
    func getCarPriceStringValue() -> String { // test
        let price = Int(model.getCars()[CarModel.selectedCarIndex ?? 0].basePrice)
        return String(price)
    }
}

// MARK: - Private Methods

private extension SecondScreenPresenter {
    private func onCalculateCarPrice() {
        let price = Int(CarModel.car?.getPrice() ?? 10000)
        let stringPrice = String(price)
        self.view?.updateCarPrice(by: stringPrice)
    }
    private func onDidSelectRowAt(index: Int) {
        self.view?.setCarImage(index: index)
    }
    
    private func setHandlers() {
        self.delegate?.onDidSelectRowAt = { [weak self] index in
            self?.onDidSelectRowAt(index: index)
        }
        self.view?.onCalculateBtnPressed = { [weak self] in
            self?.onCalculateCarPrice()
        }
    }
}
