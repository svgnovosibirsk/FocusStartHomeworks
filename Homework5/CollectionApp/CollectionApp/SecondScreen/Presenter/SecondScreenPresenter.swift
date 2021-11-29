//
//  SecondScreenPresenter.swift
//  CollectionApp
//
//  Created by Sergey Golovin on 26.11.2021.
//

import UIKit

final class SecondScreenPresenter {
    private weak var controller: DescriptionViewController?
    private weak var secondScreenView: SecondScreenView?
    
    func loadView(controller: DescriptionViewController, view: SecondScreenView) {
        self.controller = controller
        self.secondScreenView = view
        self.setHandlers()
    }
    
    private func setHandlers() {
        self.secondScreenView?.onTouchedHandler = { [weak self] in
            self?.controller?.showHistoryVC()
        }
    }
}
