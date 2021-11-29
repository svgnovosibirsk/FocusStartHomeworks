//
//  FirstScreenView.swift
//  CollectionApp
//
//  Created by Sergey Golovin on 26.11.2021.
//

import UIKit

final class FirstScreenView: UIView {
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = FlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.white
        collectionView.alwaysBounceVertical = true
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        return collectionView
    }()
    
    func getCollectionView() -> UICollectionView {
        return collectionView
    }
    
    func setCollectionViewDelegate(delegate: UICollectionViewDelegate) {
        collectionView.delegate = delegate
    }
    
    func setCollectionViewDataSource(dataSource: UICollectionViewDataSource) {
        collectionView.dataSource = dataSource
    }
}
