//
//  ViewModel.swift
//  CollectionApp
//
//  Created by Sergey Golovin on 28.11.2021.
//

import Foundation
class Observable<T> {
    var data: T {
        didSet {
            self.notify?(self.data)
        }
    }

    private var notify: ((T) -> Void)?

    init(_ data: T) {
        self.data = data
    }

    func setNotify(notify: @escaping ((T) -> Void)) {
        self.notify = notify
        self.notify?(self.data)
    }
}

class ViewModel {
    var heroNumber: Int?
    var data: Observable<String> = Observable<String>("Loading... Please wait")
    
    init() {
        self.updateModel()
    }
    
    func updateModel() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + TimeInterval(Int.random(in: 1...3))) { [weak self] in
            if let number = self?.heroNumber {
                self?.data.data = HeroModel.getHero(by: number).history
            }
        }
    }
}
