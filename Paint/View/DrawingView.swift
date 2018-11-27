//
//  DrawingView.swift
//  Paint
//
//  Created by Joseph Lee on 11/25/18.
//  Copyright © 2018 Joseph Lee. All rights reserved.
//

import UIKit

class DrawingView: UIView {
    var lastPoint: CGPoint?
    public var pathColor: CGColor = UIColor.black.cgColor
    var paths = [Path]()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let touchedBeganPoint = touch.location(in: self)
        lastPoint = touchedBeganPoint
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let lastPoint = lastPoint else { return }
        let touchedMovedPoint = touch.location(in: self)
        self.lastPoint = touchedMovedPoint
        let path = Path.init(startPoint: lastPoint, endPoint: touchedMovedPoint, color: pathColor)
        paths.append(path)
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let lastPoint = lastPoint else { return }
        let touchedEndedPoint = touch.location(in: self)
        self.lastPoint = nil
        
        let path = Path.init(startPoint: lastPoint, endPoint: touchedEndedPoint, color: pathColor)
        paths.append(path)
        setNeedsDisplay()
        
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        for eachPath in paths {
            context?.beginPath()
            context?.move(to: eachPath.startPoint)
            context?.addLine(to: eachPath.endPoint)
            context?.setStrokeColor(eachPath.color)
            context?.strokePath()
        }
    }
    
    public func clear(){
        paths = []
        setNeedsDisplay()
    }
    
}
