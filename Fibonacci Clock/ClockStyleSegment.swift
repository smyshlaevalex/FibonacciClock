//
//  ClockStyleSegment.swift
//  F-Clock
//
//  Created by Alexander Smyshlaev on 12/26/17.
//  Copyright © 2017 alex. All rights reserved.
//

import UIKit

class ClockStyleSegment: CustomSegmentedControlSegment {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet private weak var selectionView: UIView!
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        selectSegment()
    }
    
    override func didBecameSelected() {
        selectionView.isHidden = false
    }
    
    override func didBecameDeselected() {
        selectionView.isHidden = true
    }
}
