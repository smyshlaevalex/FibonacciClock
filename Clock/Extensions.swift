//
//  Extensions.swift
//  F-Clock
//
//  Created by alex on 8/24/16.
//  Copyright © 2016 alex. All rights reserved.
//

import UIKit

extension UIColor {
    static func randomColor(withRandomTransparancy rTransparancy: Bool = false) -> UIColor {
        srand48(Int(arc4random()));
        
        return UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: (rTransparancy ? CGFloat(drand48()) : 1))
    }
}

extension Int {
    static func fibonacci(withIndex index: Int) -> Int {
        guard index >= 0 else {
            fatalError("Use positive or zero number")
        }
        
        if index == 0 {
            return 0
        }
        
        var firstNumber = 0
        var secondNumber = 1
        var result = secondNumber
        
        for _ in 1..<index {
            result = firstNumber + secondNumber
            firstNumber = secondNumber
            secondNumber = result
        }
        
        return result
    }
    
    static func random(from lower: Int = 0, to higher: Int = 9) -> Int {
        return Int(arc4random_uniform(UInt32(higher - lower + 1))) + lower
    }
}

extension Float {
    static func random() -> Float {
        srand48(Int(arc4random()));
        
        return Float(drand48())
    }
}

extension Double {
    static func random() -> Double {
        srand48(Int(arc4random()));
        
        return drand48()
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        srand48(Int(arc4random()));
        
        return CGFloat(drand48())
    }
}