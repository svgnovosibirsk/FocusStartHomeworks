//
//  FirstScreenViewController.swift
//  CarPricer
//
//  Created by Sergey Golovin on 05.12.2021.
//

import UIKit

final class FirstScreenViewController: UIViewController {
    
// MARK: - Properties
    
    private var firstScreenView: FirstScreenViewProtocol?
    private var presenter:FirstScreenPresenterProtocol?
    
    struct Dependencies {
        let presenter: FirstScreenPresenterProtocol
    }
    
// MARK: - Initialization
    init(dependencies: Dependencies) {
        self.firstScreenView = FirstScreenView(frame: UIScreen.main.bounds)
        self.presenter = dependencies.presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Lofecyrcle
    
    override func loadView() {
        super.loadView()
        self.presenter?.loadView(controller: self, view: self.firstScreenView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(firstScreenView ?? UIView())
    }
}

// MARK: - FirstScreenViewControllerProtocol
extension FirstScreenViewController: FirstScreenViewControllerProtocol {

}
