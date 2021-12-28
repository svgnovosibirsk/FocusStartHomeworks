//
//  FirstScreenPresenter.swift
//  CarPricer
//
//  Created by Sergey Golovin on 05.12.2021.
//

import Foundation

final class FirstScreenPresenter {
    
// MARK: - Properties
    
    private weak var controller: FirstScreenViewControllerProtocol?
    private weak var view: FirstScreenViewProtocol?
    private let model: CarModel
    private let router: FirstScreenRouter
    private let dataSource: TableViewDataSource?
    private let delegate: TableViewDelegate?
    
    struct Dependencies {
        let model: CarModelProtocol
        let router: FirstScreenRouter
        let dataSource: TableViewDataSource
        let delegate: TableViewDelegate
    }
    
// MARK: - Initialization

    init(dependencies: Dependencies) {
        self.model = dependencies.model as? CarModel ?? CarModel()
        self.router = dependencies.router
        self.dataSource = dependencies.dataSource
        self.delegate = dependencies.delegate
    }
}

// MARK: - Private Methods

private extension FirstScreenPresenter {
    private func toNextScreen() {
        self.router.next()
    }
    
    private func setHandlers() {
        self.delegate?.onTouchedHandler = { [weak self] in
            self?.toNextScreen()
        }
    }
}

// MARK: - FirstScreenPresenterProtocol Methods

extension FirstScreenPresenter: FirstScreenPresenterProtocol {
    func loadView(controller: FirstScreenViewControllerProtocol, view: FirstScreenViewProtocol?) {
        self.controller = controller
        self.view = view
        guard let delegate = delegate,
              let dataSource = dataSource
        else { return }
        self.view?.setDelegate(delegate: delegate)
        self.view?.setDataSource(dataSource: dataSource)
        
        self.setHandlers()
    }
}

