//
//  ClockPreferences.swift
//  F-Clock
//
//  Created by Alexander Smyshlaev on 12/26/17.
//  Copyright © 2017 alex. All rights reserved.
//

import Foundation

enum ClockBorderStyle: Int {
    case black, gray
}

class ClockPreferences {
    private let borderStyle = "borderStyle"
    
    static let shared = ClockPreferences()
    
    private let sharedUserDefaults = UserDefaults(suiteName: "group.alex.clockpreferences")
    
    var clockBorderStyle: ClockBorderStyle {
        set {
            sharedUserDefaults?.set(newValue.rawValue, forKey: borderStyle)
        }
        get {
            return ClockBorderStyle(rawValue: sharedUserDefaults?.integer(forKey: borderStyle) ?? 0) ?? .black
        }
    }
    
    private init() {}
}
