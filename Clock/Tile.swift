//
//  Tile.swift
//  Fibonacci Clock
//
//  Created by alex on 8/24/16.
//  Copyright © 2016 alex. All rights reserved.
//

import UIKit

class Tile : UIView {
    enum Color {
        case white
        case red
        case green
        case blue
    }
    
    var color : Color? {
        didSet {
            guard let color = color else {
                return
            }
            
            layer.borderWidth = 2
            
            switch color {
            case .white:
                backgroundColor = UIColor.white
            case .red:
                backgroundColor = UIColor.red
            case .green:
                backgroundColor = UIColor.green
            case .blue:
                backgroundColor = UIColor.blue
            }
        }
    }
    
    var borderStyle: ClockBorderStyle? {
        didSet {
            if let borderStyle = borderStyle {
                switch borderStyle {
                case .black:
                    layer.borderColor = UIColor.black.cgColor
                case .gray:
                    layer.borderColor = UIColor.lightGray.cgColor
                }
            }
        }
    }
}
