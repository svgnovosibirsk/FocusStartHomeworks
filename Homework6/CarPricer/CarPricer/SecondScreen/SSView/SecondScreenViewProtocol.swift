//
//  SecondScreenViewProtocol.swift
//  CarPricer
//
//  Created by Sergey Golovin on 05.12.2021.
//

import UIKit

protocol SecondScreenViewProtocol: UIView {
    func update()
    func setDelegate(delegate: UITableViewDelegate)
    func setDataSource(dataSource: UITableViewDataSource)
    func setCarImage(index: Int)
    func setPriceLblText(with price: String)
    func updateCarPrice(by price: String)
    
    var onCalculateBtnPressed: (() -> Void)? { get set }
}
