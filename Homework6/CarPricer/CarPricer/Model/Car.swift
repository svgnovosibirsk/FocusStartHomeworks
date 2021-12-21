//
//  Car.swift
//  CarPricer
//
//  Created by Sergey Golovin on 05.12.2021.
//

import Foundation

struct Car {
    let model: String
    var bodyType: BodyType
    let basePrice: Double

    func getPrice() -> Double {
        switch bodyType {
        case .sedan:
            return basePrice
        case .van:
            return basePrice * 1.1
        case .universal:
            return basePrice * 0.95
        case .hatchback:
            return basePrice * 1.05
        }
    }
}
