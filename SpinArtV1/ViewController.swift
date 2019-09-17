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

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
}

extension ViewController {
    func configureViews() {
        // Heirarchy
        view.addSubview(paintBottles)
        view.addSubview(dropcloth)
        view.addSubview(paper)
        view.addSubview(resetButton)
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
