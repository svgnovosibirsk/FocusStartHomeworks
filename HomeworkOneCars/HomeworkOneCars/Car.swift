//
//  Car.swift
//  HomeworkOneCars
//
//  Created by Sergey Golovin on 29.10.2021.
//

import Foundation

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
        print("Manufacturer: \(self.manufacturer.uppercased())\nModel: \(self.model.uppercased())\nBody: \(self.body.rawValue.uppercased())\n" + (self.yearOfIssue == nil ? "yearOfIssue: -\n" : "yearOfIssue: \(String(describing: self.yearOfIssue!))\n") + (self.carNumber?.count ?? 0 < 3 ? "" : "Car Number: " + String(describing: self.carNumber!)))
    }
}
