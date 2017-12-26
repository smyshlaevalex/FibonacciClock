//
//  ViewController.swift
//  Fibonacci Clock
//
//  Created by alex on 8/24/16.
//  Copyright © 2016 alex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var clockStyleSegmentedControl: CustomSegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let clockStyleBlackBorder = Bundle.main.loadNibNamed("ClockStyleSegment", owner: self, options: nil)?.first as? ClockStyleSegment
        clockStyleBlackBorder?.segmentedControl = clockStyleSegmentedControl
        clockStyleBlackBorder?.id = 0
        clockStyleBlackBorder?.imageView.image = #imageLiteral(resourceName: "widgetBlackBorders")
        clockStyleBlackBorder?.title.text = "Black"
        let clockStyleGrayBorder = Bundle.main.loadNibNamed("ClockStyleSegment", owner: self, options: nil)?.first as? ClockStyleSegment
        clockStyleGrayBorder?.segmentedControl = clockStyleSegmentedControl
        clockStyleGrayBorder?.id = 1
        clockStyleGrayBorder?.imageView.image = #imageLiteral(resourceName: "widgetGrayBorders")
        clockStyleGrayBorder?.title.text = "Gray"
        
        clockStyleSegmentedControl.segments = [clockStyleBlackBorder, clockStyleGrayBorder].flatMap { $0 }
        
        clockStyleSegmentedControl.idOfSelectedSegment = ClockPreferences.shared.clockBorderStyle.rawValue
    }

    @IBAction func selectionChanged(_ sender: CustomSegmentedControl) {
        ClockPreferences.shared.clockBorderStyle = ClockBorderStyle(rawValue: clockStyleSegmentedControl.idOfSelectedSegment) ?? .black
    }
}

