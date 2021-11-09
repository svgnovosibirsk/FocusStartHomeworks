//
//  ThreadSafeArray.swift
//  ThreadSafeArray
//
//  Created by Sergey Golovin on 04.11.2021.
//

import Foundation

 class ThreadSafeArray<Element> {
    private var internalArray: [Element] = []
    private let isolatedQueue = DispatchQueue(label: "com.isolated.queue", attributes: .concurrent)
    
    var isEmpty: Bool {
        var empty = false
        isolatedQueue.sync {
            empty = internalArray.isEmpty
        }
        return empty
    }
    
    var  count: Int {
        var count = 0
        isolatedQueue.sync {
            count = internalArray.count
        }
        return count
    }
    
    func append(_ item: Element) {
        isolatedQueue.async(flags: .barrier) {
            self.internalArray.append(item)
        }
    }
    
    func remove(at index: Int) {
        isolatedQueue.async(flags: .barrier) {
            if index < self.internalArray.count {
                self.internalArray.remove(at: index)
            }
        }
    }
    
    subscript(index: Int) -> Element {
        get {
            var element: Element!
            self.isolatedQueue.sync {
                element = internalArray[index]
            }
            return element
        }
        
        set {
            isolatedQueue.async(flags: .barrier) {
                self.internalArray[index] = newValue
            }
        }
    }
}

extension ThreadSafeArray where Element: Equatable {
    func contains(_ element: Element) -> Bool {
        var hasElement = false
        isolatedQueue.sync {
            hasElement = self.internalArray.contains(element)
        }
        return hasElement
    }
}
