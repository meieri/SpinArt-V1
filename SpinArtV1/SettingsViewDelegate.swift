//
//  SettingsViewDelegate.swift
//  SpinArtV1
//
//  Created by Isaak Meier on 9/23/19.
//  Copyright © 2019 Isaak Meier. All rights reserved.
//

import UIKit
import Foundation

// This is the delegate protocol
protocol SettingsViewDelegate: AnyObject {
    // Classes that adopt this protocol MUST define these methods
    func settingsView(_ settingsView: SettingsView, didPerformAction action: Action)
}

