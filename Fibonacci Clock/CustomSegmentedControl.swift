//
//  CustomSegmentedControl.swift
//  F-Clock
//
//  Created by Alexander Smyshlaev on 12/26/17.
//  Copyright © 2017 alex. All rights reserved.
//

import UIKit

class CustomSegmentedControlSegment: UIView {
    var isSelected = false {
        didSet {
            if isSelected {
                didBecameSelected()
            } else {
                didBecameDeselected()
            }
        }
    }
    var segmentedControl: CustomSegmentedControl?
    var id = 0
    
    func selectSegment() {
        segmentedControl?.segments?.filter { $0 != self }.forEach { $0.isSelected = false }
        isSelected = true
        
        segmentedControl?.selectionChangedToSegment(with: id)
    }
    
    func didBecameSelected() {}
    func didBecameDeselected() {}
}

class CustomSegmentedControl: UIControl {
    var isInitialized = false
    
    private weak var segmentsStackView: UIStackView?
    var segments: [CustomSegmentedControlSegment]?
    
    var idOfSelectedSegment = 0
    
    override func layoutSubviews() {
        if !isInitialized {
            
            segments?.forEach { $0.isSelected = $0.id == self.idOfSelectedSegment }
            
            let stackView = UIStackView(arrangedSubviews: segments ?? [])
            segmentsStackView = stackView
            stackView.alignment = .fill
            stackView.distribution = .fillEqually
            stackView.axis = .horizontal
            stackView.spacing = 20
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            addSubview(stackView)
            
            NSLayoutConstraint.activate([
                    NSLayoutConstraint(item: stackView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0),
                    NSLayoutConstraint(item: stackView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0),
                    NSLayoutConstraint(item: stackView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0),
                    NSLayoutConstraint(item: stackView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
            ])
            
            isInitialized = true
        }
    }
    
    func selectionChangedToSegment(with id: Int) {
        if idOfSelectedSegment != id {
            idOfSelectedSegment = id
            
            sendActions(for: .valueChanged)
        }
    }
}
