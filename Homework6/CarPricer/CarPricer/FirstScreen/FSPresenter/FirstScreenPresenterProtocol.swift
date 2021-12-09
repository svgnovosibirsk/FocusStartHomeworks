//
//  FirstScreenPresenterProtocol.swift
//  CarPricer
//
//  Created by Sergey Golovin on 05.12.2021.
//

import Foundation

protocol FirstScreenPresenterProtocol: AnyObject {
    func loadView(controller: FirstScreenViewControllerProtocol, view: FirstScreenViewProtocol?)
}
