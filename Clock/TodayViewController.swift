//
//  TodayViewController.swift
//  Clock
//
//  Created by alex on 8/24/16.
//  Copyright © 2016 alex. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    @IBOutlet weak var smallScreen0: Tile!
    @IBOutlet weak var smallScreen1: Tile!
    @IBOutlet weak var screen0: Tile!
    @IBOutlet weak var largeScreen0: Tile!
    @IBOutlet weak var giantScreen0: Tile!
    
    var screen: [Tile]!
    
    var timer: Timer?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 10.0, *) {
            extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        }
        
        let borderStyle = ClockPreferences.shared.clockBorderStyle
        
        screen = [smallScreen0, smallScreen1, screen0, largeScreen0, giantScreen0]
        
        for i in screen {
            i.color = .white
            i.borderStyle = borderStyle
        }
        
        updateClock()
        timer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(updateClock), userInfo: nil, repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.newData)
    }
    
    func widgetMarginInsets(forProposedMarginInsets defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    @available(iOS 10, *)
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        if activeDisplayMode == .expanded {
            preferredContentSize = CGSize(width: 0, height: 200)
        } else {
            preferredContentSize = maxSize
        }
    }
    
    func updateClock() {
        let date = Date()
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components([.hour, .minute], from: date)
        let hour = components.hour
        let minutes = components.minute
        
        var hour12 = hour
        if hour12! > 12 {
            hour12 = hour! - 12
        } else if hour12 == 0 {
            hour12 = 12
        }
        
        var minutes5 = minutes!/5
        
        for i in screen {
            i.color = .white
        }
        
        for i in (1...5).reversed() {
            let fib = Int.fibonacci(withIndex: i)
            
            if hour12! - fib >= 0 {
                hour12! -= fib
                screen[i-1].color = .red
            }
        }
        
        for i in (1...5).reversed() {
            let fib = Int.fibonacci(withIndex: i)
            
            if minutes5 - fib >= 0 {
                minutes5 -= fib
                if screen[i-1].color == .white {
                    screen[i-1].color = .green
                } else {
                    screen[i-1].color = .blue
                }
            }
        }
    }
}
