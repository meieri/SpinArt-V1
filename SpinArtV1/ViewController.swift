//
//  ViewController.swift
//  SpinArtV1
//
//  Created by Isaak Meier on 9/13/19.
//  Copyright © 2019 Isaak Meier. All rights reserved.
//

import UIKit
import Anchorage

class ViewController: UIViewController, SettingsViewDelegate {


    // Touch handling, drawing, etc. ViewController can do standing up of views, heirarchy, etc.
    let spinArtMachine = SpinArtView()
    let controls = SettingsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()

        controls.delegate = self
         // paper.rotate()
    }

    func resetBoard() {
        spinArtMachine.paper.resetBoard()
    }

    func changeColor(sender: UIButton) {
        spinArtMachine.paper.changeColor(sender: sender)
    }
}

extension ViewController {
    func configureViews() {
        // Heirarchy
        view.addSubview(spinArtMachine)
        view.addSubview(controls)

        // Style

        // Layout
        spinArtMachine.widthAnchor == view.widthAnchor
        spinArtMachine.topAnchor == view.topAnchor
        spinArtMachine.bottomAnchor == 3 * view.bottomAnchor / 4
        spinArtMachine.backgroundColor = .white

        controls.widthAnchor == view.widthAnchor
        controls.bottomAnchor == view.bottomAnchor
        controls.topAnchor == spinArtMachine.bottomAnchor
        controls.backgroundColor = .lightGray
    }
}

extension UIView {
    private static let kRotationAnimationKey = "rotationanimationkey"

    func rotate(_ duration: Double = 1) {
         if layer.animation(forKey: UIView.kRotationAnimationKey) == nil {
             let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
             rotationAnimation.fromValue = 0.0
             rotationAnimation.toValue = Float.pi * 2.0
             rotationAnimation.duration = duration
             rotationAnimation.repeatCount = Float.infinity

             layer.add(rotationAnimation, forKey: UIView.kRotationAnimationKey)
         }
    }

    func stopRotating() {
         if layer.animation(forKey: UIView.kRotationAnimationKey) != nil {
             layer.removeAnimation(forKey: UIView.kRotationAnimationKey)
         }
    }
}
