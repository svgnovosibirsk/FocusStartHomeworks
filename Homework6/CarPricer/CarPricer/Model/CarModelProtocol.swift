//
//  CarModelProtocol.swift
//  CarPricer
//
//  Created by Sergey Golovin on 05.12.2021.
//

import Foundation

protocol CarModelProtocol {
    func getCars() -> [Car]
    func getModels() -> [String]
    func getBodyTypes() -> [String]
    func instantiateCar(index: Int)
}
