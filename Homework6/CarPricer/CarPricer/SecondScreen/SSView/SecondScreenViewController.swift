//
//  SecondScreenViewController.swift
//  CarPricer
//
//  Created by Sergey Golovin on 05.12.2021.
//

import UIKit

final class SecondScreenViewController: UIViewController {
    
// MARK: - Properties
    
    private var secondScreenView: SecondScreenViewProtocol?
    private var secondScreenPresenter: SecondScreenPresenterProtocol?
    
    struct Dependencies {
        let presenter: SecondScreenPresenterProtocol
    }
    
// MARK: - Initialization
    
    init(dependencies: Dependencies) {
        self.secondScreenView = SecondScreenView(frame: UIScreen.main.bounds)
        self.secondScreenPresenter = dependencies.presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.secondScreenPresenter?.loadView(controller: self, view: self.secondScreenView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.view.addSubview(secondScreenView ?? UIView())
        
        self.setViewPriceLblText()
        self.secondScreenView?.update()
    }
}

// MARK: - Private Methods

private extension SecondScreenViewController {
    private func setViewPriceLblText() {
        if let price = secondScreenPresenter?.getCarPriceStringValue() {
            secondScreenView?.setPriceLblText(with: price)
        }
    }
}

// MARK: - SecondScreenViewControllerProtocol

extension SecondScreenViewController: SecondScreenViewControllerProtocol {
    
}
