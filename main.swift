//
//  main.swift
//  dz6
//
//  Created by Владимир Глоба on 08.12.2021.
//

import Foundation

//MARK: - Queue structure announcement
struct Queue<T> {
    
    //MARK: - Private properties
    fileprivate var elements: [T] = []
    
    fileprivate var isEmpty: Bool {
        
        return elements.isEmpty
        
    }
    
    fileprivate var count: Int {
        
        return elements.count
        
    }
    
    //MARK: - Methods
    mutating func add(element: T) {
        
        elements.append(element)
        
    }
    
    mutating func remove() -> T? {
        
        if isEmpty {
            
            return nil
            
        } else {
            
            let removedElement = elements.first
            print("Из очереди удален элемент \(String(describing: removedElement))")
            return elements.removeFirst()
            
        }
    }
    
    func countQueue() {
        
        print("Элементов в очереди: \(count)")
        
    }
    
    func printQueue() {
        
        print("Элементы сейчас в очереди: \(elements)")
        
    }
    
    func filter(closure: (T) -> Bool) -> [T] {
        
        var result = [T]()
        
        for element in elements {
            if closure(element) {
                result.append(element)
            }
        }
        
        return result
    }
    
}

//MARK: - Test zone

var number = Queue<Int>()
number.add(element: 3)
number.add(element: 4)
number.add(element: 10)
number.remove()
number.printQueue()

let filtredNumber = number.filter(closure: {$0 < 5})
print(filtredNumber)

