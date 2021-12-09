//
//  FirstScreenViewProtocol.swift
//  CarPricer
//
//  Created by Sergey Golovin on 05.12.2021.
//

import UIKit

protocol FirstScreenViewProtocol: UIView {
    var onTouchedHandler: (() -> Void)? { get set }
    
    func setDelegate(delegate: UITableViewDelegate)
    func setDataSource(dataSource: UITableViewDataSource)
}
