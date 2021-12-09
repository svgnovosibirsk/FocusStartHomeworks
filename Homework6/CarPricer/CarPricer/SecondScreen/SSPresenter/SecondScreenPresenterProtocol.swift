//
//  SecondScreenPresenterProtocol.swift
//  CarPricer
//
//  Created by Sergey Golovin on 05.12.2021.
//

import Foundation

protocol SecondScreenPresenterProtocol {
    func loadView(controller: SecondScreenViewControllerProtocol, view: SecondScreenViewProtocol?)
    func getCarPriceStringValue() -> String
}
