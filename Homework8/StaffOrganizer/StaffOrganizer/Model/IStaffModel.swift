//
//  IStaffModel.swift
//  StaffOrganizer
//
//  Created by Sergey Golovin on 16.12.2021.
//

import Foundation
import CoreData

protocol IStaffModel {
    var persistentContainer: NSPersistentContainer { get }
    
    func getCompanies() -> [Company]
    func setCompanies(with data: [Company])
    func addCompanies(with data: Company)
    func getEmploees() -> [Employee]
    func setEmploees(with data: [Employee])
    func addEmploees(with data: Employee)
    func deleteCompany(at index: Int)
    func deleteEmploee(at index: Int)
    func saveContext()
}
