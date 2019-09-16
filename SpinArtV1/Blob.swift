//
//  Blob.swift
//  SpinArtV1
//
//  Created by Isaak Meier on 9/16/19.
//  Copyright © 2019 Isaak Meier. All rights reserved.
//
// Idea: Drip speed? Single drop -> Stream?
// How does the blob know where to draw itself?

// Not object, structs: data--
// Some function somewhere that takes a list of blobs, and 'steps' them into new blobs

import Foundation
import UIKit

struct Blob {
    var inkAmount: Int
    var position: CGPoint
    var color: UIColor
    var radius: Int
    // Should this own ViewController? NO

    init(postion: CGPoint) {
        self.inkAmount = 100
        self.position = postion
        self.color = UIColor.black
        self.radius = 10
    }

}
