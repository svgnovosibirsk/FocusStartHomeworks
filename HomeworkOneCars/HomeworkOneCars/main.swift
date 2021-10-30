//
//  main.swift
//  HomeworkOneCars
//
//  Created by Sergey Golovin on 29.10.2021.
//

import Foundation

var allCarsArray = [Car]()

var isContinue = "y"

while("y" == isContinue) {
    printMenu()
    
    if let mItem = readLine()?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) {
        checkMenuItemInput(menuItem: mItem)
    }
    
    print("Continue? y/n")
    isContinue = readLine()?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) ?? "n"
}

private func printMenu() {
    print("Enter 1 to add new car")
    print("Enter 2 to print list of cars")
    print("Enter 3 to print list of cars sorted by body type")
}

private func checkMenuItemInput(menuItem: String) {
    if let mItem = Int(menuItem) {
        switch mItem {
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

    print("Enter manufacturer:")
    if let enteredManufacturer = readLine(), enteredManufacturer.count > 0 {
        manufacturer = enteredManufacturer
    } else {
        manufacturer = "unknown"
    }
       
    print("Enter model:")
    if let enteredModel = readLine(), enteredModel.count > 0 {
        model = enteredModel
    } else {
        model = "unknown"
    }

    print("Enter body: sedan, liftback, hatchback or cabriolet")
    if let enteredBody = readLine(), enteredBody.count > 0 {
        body = Body(rawValue: enteredBody) ?? .unknown
        } else {
        body = .unknown
        handleMistakes()
    }
    
    print("Enter year of issue:")
    if let enteredYear = Int(readLine() ?? "") {
        yearOfIssue = enteredYear
    } else {
        yearOfIssue = nil
    }
    
    print("Enter car number:")
    if let enteredNumber = readLine() {
        carNumber = enteredNumber
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
