//
//  Observable.swift
//  MVVMSample
//
//  Created by Muhammad Zaheer on 19/11/2023.
//

import Foundation

class Observable<T> {
    var value : T {
        didSet {
            self.listener?(self.value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    var listener: ((T) -> Void)?
    
    func bind(_ listener: @escaping ((T) -> ())) {
        listener(self.value)
        self.listener = listener
    }
    
}
