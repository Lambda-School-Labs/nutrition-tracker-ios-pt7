//
//  Weight.swift
//  Nutrivurv
//
//  Created by Dillon on 8/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Combine
import SwiftUI

class Weight: ObservableObject {
    let objectWillChange = PassthroughSubject<Any, Never>()
    
    @Published var weightReadings: [Double] = [] {
        willSet {
            objectWillChange.send(newValue)
        }
    }
    
    @Published var rateChange: Double = 0 {
        willSet {
            objectWillChange.send(newValue)
        }
    }
}
