//
//  Defaults.swift
//  MVVMC-Demo
//
//  Created by thoonk on 2023/01/12.
//

import Foundation

class Defaults {
    enum DefaultKeys: String {
        case isLogined
    }
    
    static let shared = Defaults()
    private let defaults = UserDefaults.standard
    
    private init() {}
    
    func set(isLogined: Bool) {
        defaults.set(isLogined, forKey: DefaultKeys.isLogined.rawValue)
    }
    
    func getIsLogined() -> Bool? {
        if let data = defaults.value(forKey: DefaultKeys.isLogined.rawValue) as? Bool {
            return data
        } else {
            return nil
        }
    }
    
    func synchronize() {
        defaults.synchronize()
    }
}


