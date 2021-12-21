//
//  SecondScreenAssembley.swift
//  CarPricer
//
//  Created by Sergey Golovin on 05.12.2021.
//

import UIKit

final class SecondScreenAssembley {
    static func build() -> UIViewController {
        let model = CarModel()
        
        let dataSource = SSTableViewDataSource(carModel: model)
        let delegate = SSTableViewDelegate(carModel: model)

        let presenter = SecondScreenPresenter(dependencies: .init(model: model,
                                                                  dataSource: dataSource,
                                                                  delegate: delegate))
        
        let controller = SecondScreenViewController(dependencies: .init(presenter: presenter))
        
        return controller
    }
}
