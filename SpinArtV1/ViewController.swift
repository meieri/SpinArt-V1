//
//  ViewController.swift
//  SpinArtV1
//
//  Created by Isaak Meier on 9/13/19.
//  Copyright © 2019 Isaak Meier. All rights reserved.
//

import UIKit
import Anchorage

class ViewController: UIViewController {
    let paintBottles = UIView()
    let dropcloth = UIView()
    // Touch handling, drawing, etc. ViewController can do standing up of views, heirarchy, etc.
    let paper = PaperView()

    let resetButton = UIButton()
    let blueButton = UIButton()
    let redButton = UIButton()
    let greenButton = UIButton()
    let blackButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        // paper.rotate()
    }
}

extension ViewController {
    func configureViews() {
        // Heirarchy
        view.addSubview(paintBottles)
        view.addSubview(dropcloth)
        view.addSubview(paper)
        view.addSubview(resetButton)
        view.addSubview(redButton)
        view.addSubview(greenButton)
        view.addSubview(blueButton)
        view.addSubview(blackButton)
        // Style
        dropcloth.horizontalAnchors == view.horizontalAnchors
        dropcloth.topAnchor == view.topAnchor
        dropcloth.bottomAnchor == view.bottomAnchor - 200
        dropcloth.backgroundColor = UIColor.white

        resetButton.centerXAnchor == self.view.centerXAnchor
        resetButton.topAnchor == self.view.topAnchor + 100
        resetButton.widthAnchor == paper.widthAnchor / 2
        resetButton.backgroundColor = .red
        resetButton.setTitle("Reset", for: .normal)
        resetButton.addTarget(paper, action: #selector(paper.resetBoard), for: .touchUpInside)

        redButton.addTarget(paper, action: #selector(paper.changeColor), for: .touchUpInside)
        redButton.tag = 0
        blueButton.addTarget(paper, action: #selector(paper.changeColor), for: .touchUpInside)
        blueButton.tag = 1
        greenButton.addTarget(paper, action: #selector(paper.changeColor), for: .touchUpInside)
        greenButton.tag = 2
        blackButton.addTarget(paper, action: #selector(paper.changeColor), for: .touchUpInside)
        blackButton.tag = 3

        redButton.leadingAnchor == view.leadingAnchor + 10
        redButton.topAnchor == view.topAnchor + 50
        redButton.heightAnchor == 30
        redButton.widthAnchor == 75
        redButton.backgroundColor = .red

        blueButton.leadingAnchor == view.leadingAnchor + 10
        blueButton.topAnchor == redButton.bottomAnchor + 10
        blueButton.heightAnchor == 30
        blueButton.widthAnchor == 75
        blueButton.backgroundColor = .blue

        greenButton.heightAnchor == 30
        greenButton.widthAnchor == 75
        greenButton.leadingAnchor == view.leadingAnchor + 10
        greenButton.topAnchor == blueButton.bottomAnchor + 10
        greenButton.backgroundColor = .green

        blackButton.heightAnchor == 30
        blackButton.widthAnchor == 75
        blackButton.leadingAnchor == view.leadingAnchor + 10
        blackButton.topAnchor == greenButton.bottomAnchor + 10
        blackButton.backgroundColor = .black

        paper.centerXAnchor == self.view.centerXAnchor
        paper.centerYAnchor == self.view.centerYAnchor - 50
        paper.widthAnchor == 250
        paper.heightAnchor == 250

        paper.layer.shadowColor = UIColor.black.cgColor
        paper.layer.shadowOpacity = 1
        paper.layer.shadowOffset = .zero
        paper.layer.shadowRadius = 10
        paper.backgroundColor = .white
        // cache shadow
        // also set shadow path
        // You never run into problems with one of anything
        // Don't make optimization changes without concrete evidence that one way is better
        paper.layer.shouldRasterize = true
        paper.layer.rasterizationScale = UIScreen.main.scale

        // Finesse
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
