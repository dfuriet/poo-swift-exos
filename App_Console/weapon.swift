//
//  weapon.swift
//  App_Console
//
//  Created by Damien FURIET on 10/08/2022.
//  Copyright © 2022 mbritto. All rights reserved.
//

import Foundation

class Weapon {
    private let name:String
    private var _power:Int
    private var _accuracy:Double
    
    var power:Int {
        get { _power }
        set {
            _power = max (0, newValue)
        }
    }
    
    var accuracy:Double {
        get { _accuracy}
        set {
            _accuracy = newValue
        }
    }
    
    init(name:String, power:Int = 1, accuracy:Double = 1.0) {
        self.name = name
        self._power = 1
        self._accuracy = 0.75
    }
    
    /*
    convenience init(name:String, power:Int = 1, accuracy:Double = 1.0) {
        self.init(name:name)
        self._power = power
        self._accuracy = accuracy
    }
    */
    
    func get_name() -> String {
        return self.name
    }
}
