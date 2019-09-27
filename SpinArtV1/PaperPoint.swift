//
//  PaperPoint.swift
//  SpinArtV1
//
//  Created by Isaak Meier on 9/17/19.
//  Copyright © 2019 Isaak Meier. All rights reserved.
//

import Foundation
import UIKit

// Represents a point translated in terms of a UIView
struct PaperPoint: Equatable {
    var x: CGFloat
    var y: CGFloat

    init(x: CGFloat, y: CGFloat) {
        self.x = x
        self.y = y
    }
}
