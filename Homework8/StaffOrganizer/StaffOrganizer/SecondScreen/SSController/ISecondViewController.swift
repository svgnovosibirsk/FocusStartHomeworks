//
//  ISecondViewController.swift
//  StaffOrganizer
//
//  Created by Sergey Golovin on 17.12.2021.
//

import Foundation

protocol ISecondViewController: AnyObject {
    func getEmploees() -> [Employee]
    func deleteEmploee(at index: Int)
    func editEmploee(at index: Int, isEditMode: Bool)
}
