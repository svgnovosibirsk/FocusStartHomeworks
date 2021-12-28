//
//  StaffModel.swift
//  StaffOrganizer
//
//  Created by Sergey Golovin on 16.12.2021.
//

import Foundation
import CoreData

final class StaffModel {
    
    static let shared = StaffModel()
    private init() {}
    
    var companies = [Company]()
    var emploees = [Employee]()
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "StaffOrganizer")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
}

// MARK: - IStaffModel
extension StaffModel: IStaffModel {
    func getCompanies() -> [Company] {
        return self.companies
    }
    
    func setCompanies(with data: [Company]) {
        self.companies = data
    }
    
    func addCompanies(with data: Company) {
        self.companies.append(data)
    }
    
    func deleteCompany(at index: Int) {
        self.companies.remove(at: index)
    }
    
    func getEmploees() -> [Employee] {
        return self.emploees
    }
    
    func setEmploees(with data: [Employee]) {
        self.emploees = data
    }
    
    func addEmploees(with data: Employee) {
        self.emploees.append(data)
    }
    
    func deleteEmploee(at index: Int) {
        self.emploees.remove(at: index)
    }
    
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
   

    
