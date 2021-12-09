//
//  FirstScreenAssembly.swift
//  CarPricer
//
//  Created by Sergey Golovin on 05.12.2021.
//

import UIKit

final class FirstScreenAssembly {
    static func build() -> UIViewController {
        let model = CarModel()
        let router = FirstScreenRouter()
        
        let dataSource = TableViewDataSource(carModel: model)
        let delegate = TableViewDelegate(carModel: model)
        
        let presenter = FirstScreenPresenter(dependencies: .init(model: model,
                                                                 router: router,
                                                                 dataSource: dataSource,
                                                                 delegate: delegate))
        
        let controller = FirstScreenViewController(dependencies: .init(presenter: presenter))
        let targetController = SecondScreenAssembley.build()

        router.setRootController(controller: controller)
        router.setTargerController(controller: targetController)

        return controller
    }
}
