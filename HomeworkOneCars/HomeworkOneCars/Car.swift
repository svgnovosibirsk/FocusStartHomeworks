//
//  Car.swift
//  HomeworkOneCars
//
//  Created by Sergey Golovin on 29.10.2021.
//

import Foundation

enum Body: String {
    case sedan
    case liftback
    case hatchback
    case cabriolet
    case unknown
}

struct Car {
    let manufacturer: String
    let model: String
    let body: Body
    let yearOfIssue: Int?
    let carNumber: String?
    
    func printCar() {
        
        let carDescription =
            """
            Manufacturer: \(self.manufacturer)
            Model: \(self.model)
            Body: \(self.body)
            Year of issue: \(yearOfIssue?.description ?? "-")
            \(carNumber?.count ?? 0 > 1 ? "Car number: \(String(describing: carNumber))" : "")
        """
        
        print(carDescription)
    }
}
