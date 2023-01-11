//
//  Binding.swift
//  Architecture Patterns
//
//  Created by Yevhen Biiak on 11.01.2023.
//

class Binding<T> {
    typealias Listener = (T) -> ()
    
    private var listeners: [Listener] = []
    
    var value: T {
        didSet {
            listeners.forEach { $0(value) }
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ listener: @escaping Listener) {
        self.listeners.append(listener)
        listener(value)
    }
}
