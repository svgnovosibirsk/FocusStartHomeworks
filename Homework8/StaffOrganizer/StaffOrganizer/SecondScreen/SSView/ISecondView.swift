//
//  ISecondView.swift
//  StaffOrganizer
//
//  Created by Sergey Golovin on 17.12.2021.
//

import UIKit

protocol ISecondView: UIView {
    func loadView(controller: ISecondViewController)
    func configView()
    func update()
}
