//
//  DescriptionViewController.swift
//  TableViewApp1
//
//  Created by Sergey Golovin on 19.11.2021.
//

import UIKit

final class DescriptionViewController: UIViewController {
    private var secondScreenView = SecondScreenView()
    private var secondScreenPresenter = SecondScreenPresenter()
    
    var heroNumber: Int?

    override func loadView() {
        super.loadView()
        self.secondScreenPresenter.loadView(controller: self, view: self.secondScreenView)
        self.secondScreenView.setUpSecondScreenView()
        self.view = secondScreenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = " "
        navigationController?.navigationBar.tintColor = UIColor.red

        self.setHeroImage()
        self.setHeroDescription()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.view = secondScreenView
    }
    
    func showHistoryVC() {
        let historyVC = HistoryViewController()
        historyVC.viewModel.heroNumber = heroNumber
        present(historyVC, animated: true)
    }
}

// MARK: - Private Methods

private extension DescriptionViewController {
    private func setHeroImage() {
        if let number = heroNumber {
            let hero = HeroModel.getHero(by: number)
            secondScreenView.setHeroImage(hero: hero)
        }
    }
    
    private func setHeroDescription() {
        if let number = heroNumber {
            let hero = HeroModel.getHero(by: number)
            secondScreenView.setHeroDescription(hero: hero)
        }
    }
}
