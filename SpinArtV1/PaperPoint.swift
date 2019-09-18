//
//  PaperPoint.swift
//  SpinArtV1
//
//  Created by Isaak Meier on 9/17/19.
//  Copyright © 2019 Isaak Meier. All rights reserved.
//

// Represents a point translated in terms of a UIView
import Foundation
import UIKit

struct PaperPoint {
    var x: CGFloat
    var y: CGFloat
    private var frame: CGRect

    var point: CGPoint {
        let nx = x + (frame.width / 2)
        let ny = y + (frame.height / 2)
        return CGPoint(x: nx, y: ny)
    }

    init(point: CGPoint, frame: CGRect) {
        self.frame = frame
        x = point.x - (frame.width / 2)
        y = point.y - (frame.height / 2)
    }

    // THe only responsibility for paperpoint is to be a different type than CGPoint (making them uninterchangable)
    func stepPoint() -> PaperPoint {
        let nx = x / 50
        let ny = y / 50
        return PaperPoint(point: CGPoint(x: nx, y: ny), frame: frame)
    }
}
