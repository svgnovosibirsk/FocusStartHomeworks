//
//  CarModel.swift
//  CarPricer
//
//  Created by Sergey Golovin on 05.12.2021.
//

import Foundation

final class CarModel {
    // MARK: - Properties

    static var selectedCarIndex: Int?
    static var car: Car?
}

// MARK: - CarModelProtocol Methods

extension CarModel: CarModelProtocol {
    func getCars() -> [Car] {
        return [Car(model: "BMW", bodyType: .sedan, basePrice: 20_000),
                Car(model: "Audi", bodyType: .sedan, basePrice: 18_000),
                Car(model: "Ford", bodyType: .sedan, basePrice: 15_000),
                Car(model: "Honda", bodyType: .sedan, basePrice: 17_000),
                Car(model: "Lada", bodyType: .sedan, basePrice: 10_000)]
    }
    
    func getModels() -> [String] {
        return ["BMW", "Audi", "Ford", "Honda", "Lada"]
    }
    
    func getBodyTypes() -> [String] {
        return ["Седан","Фургон", "Универсал", "Хэтчбек"]
    }
    
    func instantiateCar(index: Int) {
        if index < getCars().count {
            CarModel.car = getCars()[index]
        }
    }
}
