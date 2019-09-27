//
//  Action.swift
//  SpinArtV1
//
//  Created by Isaak Meier on 9/23/19.
//  Copyright © 2019 Isaak Meier. All rights reserved.
//

import Foundation

enum Action {
    case color (Color)
    case reset
}

enum Color: Int {
    case red = 1
    case blue
    case green
    case black
}
