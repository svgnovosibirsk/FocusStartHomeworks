//
//  main.swift
//  ThreadSafeArray
//
//  Created by Sergey Golovin on 03.11.2021.
//

import Foundation

var threadSafeArray = ThreadSafeArray<Int>()

let utilityQueue = DispatchQueue.global(qos: .utility)
let arrayAppendGroup = DispatchGroup()

let firstTask =  {
    for number in 0...1000 {
        threadSafeArray.append(number)
    }
}

let secondTask =  {
    for number in 0...1000 {
        threadSafeArray.append(number)
    }
}

utilityQueue.async(group: arrayAppendGroup) {
    firstTask()
}

utilityQueue.async(group: arrayAppendGroup) {
    secondTask()
}

arrayAppendGroup.notify(queue: DispatchQueue.global()) {
    
    print("threadSafeArray.count = \(threadSafeArray.count)")
}

_ = readLine()
