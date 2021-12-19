//
//  IFirstView.swift
//  StaffOrganizer
//
//  Created by Sergey Golovin on 16.12.2021.
//

import UIKit

protocol IFirstView: UIView {
    func loadView(controller: IFirstViewController)
    func configView()
    func update()
}
