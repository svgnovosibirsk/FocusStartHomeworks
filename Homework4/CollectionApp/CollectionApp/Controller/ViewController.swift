//
//  ViewController.swift
//  TableViewApp1
//
//  Created by Sergey Golovin on 18.11.2021.
//

import UIKit

final class ViewController: UIViewController {
    
    private var heroArray: [SuperHero] = SuperHero.createSuperHeroArray()
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = FlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.white
        collectionView.alwaysBounceVertical = true
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    override func loadView() {
        self.view = self.collectionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MARVEL"
    }
}

// MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let descVC = DescriptionViewController()
        descVC.hero = heroArray[indexPath.item]
        self.navigationController?.pushViewController(descVC, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heroArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        let hero = heroArray[indexPath.item]
        cell.configure(with: hero)
        
        return cell
    }
}

