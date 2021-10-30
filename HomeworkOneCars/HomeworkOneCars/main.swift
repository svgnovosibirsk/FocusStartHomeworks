//
//  main.swift
//  HomeworkOneCars
//
//  Created by Sergey Golovin on 29.10.2021.
//

import Foundation

var allCarsArray = [Car]()

var isContinue = true

while(isContinue) {
    printMenu()
    
    if let mItem = readLine()?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) {
        checkMenuItemInput(menuItem: mItem)
    }
}

private func printMenu() {
    print("Enter 1 to add new car")
    print("Enter 2 to print list of cars")
    print("Enter 3 to print list of cars sorted by body type")
    print("Enter 0 to Quit")
}

private func checkMenuItemInput(menuItem: String) {
    if let mItem = Int(menuItem) {
        switch mItem {
        case 0:
            isContinue = false
        case 1:
            addNewAuto()
        case 2:
            printListOfAuto(carArray: allCarsArray)
        case 3:
            printFilteredListOfAuto()
        default:
            handleMistakes()
        }
    } else {
        handleMistakes()
    }
}

private func addNewAuto() {

    var manufacturer: String
    var model: String
    var body: Body
    var yearOfIssue: Int?
    var carNumber: String?

    manufacturer = getUserInputForCarWith(message: "Enter manufacturer:")
    
    model = getUserInputForCarWith(message: "Enter model:")

    let potentialCarBody = getUserInputForCarWith(message: "Enter body: sedan, liftback, hatchback or cabriolet")
    if potentialCarBody != "unknown" {
        body = Body(rawValue: potentialCarBody) ?? .unknown
    } else {
        body = .unknown
        handleMistakes()
    }

    yearOfIssue = Int(getUserInputForCarWith(message: "Enter year of issue:"))
    
    let potentialCarNumber = getUserInputForCarWith(message: "Enter car number:")
    if potentialCarNumber != "unknown" {
        carNumber = potentialCarNumber
    } else {
        carNumber = nil
    }
    
    let newCar = Car(manufacturer: manufacturer,
                     model: model,
                     body: body,
                     yearOfIssue: yearOfIssue,
                     carNumber: carNumber)
    
    allCarsArray.append(newCar)
}

private func getUserInputForCarWith(message: String) -> String {
    print(message)
    var property = "unknown"
    if let enteredProperty = readLine(), enteredProperty.count > 0 {
        property = enteredProperty
    }
    return property
}

private func printListOfAuto(carArray: [Car]) {
    if 0 == carArray.count {
        print("No cars in a list")
    } else {
        for car in carArray {
            car.printCar()
            print()
        }
    }
}

private func printFilteredListOfAuto() {
    var sortedCars = [Car]()
    
    print("Enter body: sedan, liftback, hatchback or cabriolet")
    if let enteredBody = readLine() {
        sortedCars = allCarsArray.filter {
            $0.body.rawValue == enteredBody
        }
    }
    
    if sortedCars.count != 0 {
        printListOfAuto(carArray: sortedCars)
    } else {
        print("No cars with such body in a list")
    }
}

private func handleMistakes() {
    print("Incorrect enter. Please try again.")
    print()
}
