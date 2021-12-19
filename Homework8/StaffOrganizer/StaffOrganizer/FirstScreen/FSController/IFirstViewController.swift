//
//  IFirstViewController.swift
//  StaffOrganizer
//
//  Created by Sergey Golovin on 16.12.2021.
//

import Foundation

protocol IFirstViewController: AnyObject {
    func getCompanies() -> [Company]
    func moveToSecondVC(with company: Company)
    func deleteCompany(at index: Int)
}
