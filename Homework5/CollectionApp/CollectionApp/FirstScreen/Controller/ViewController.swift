//
//  ViewController.swift
//  TableViewApp1
//
//  Created by Sergey Golovin on 18.11.2021.
//

import UIKit

final class ViewController: UIViewController {
    private var firstScreenView = FirstScreenView()

    override func loadView() {
        setCollectionView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MARVEL"
    }
}

// MARK: - Private Methods

private extension ViewController {
    private func setCollectionView() {
        self.view = firstScreenView.getCollectionView()
        firstScreenView.setCollectionViewDelegate(delegate: self)
        firstScreenView.setCollectionViewDataSource(dataSource: self)
    }
}

// MARK: - UICollectionViewDelegate

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let descVC = DescriptionViewController()
        descVC.heroNumber = indexPath.item
        self.navigationController?.pushViewController(descVC, animated: true)
    }
}

// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HeroModel.createSuperHeroArray().count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        let hero = HeroModel.getHero(by: indexPath.item)
        cell.configure(with: hero)

        return cell
    }
}

