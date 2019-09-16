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
    let paper = UIView()
    var paperImageView = UIImageView()

    var lastPoint = CGPoint.zero
    var color = UIColor.black
    var brushWidth: CGFloat = 20.0
    var swiped = false

    // Move a lot of this stuff into the pay per view
    // Touch handling, drawing, etc. ViewController can do standing up of views, heirarchy, etc.
    //

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureViews()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        swiped = false
        lastPoint = touch.location(in: paper)
        print(lastPoint)
        // paper = view
        // paperImageView = tempImageView and mainImageView
    }

    func drawLine(from fromPoint: CGPoint, to toPoint: CGPoint) {
        UIGraphicsBeginImageContext(paper.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        paperImageView.image?.draw(in: paper.bounds)
        context.move(to: fromPoint)
        context.addLine(to: toPoint)
        context.setLineCap(.round)
        context.setBlendMode(.normal)
        context.setLineWidth(brushWidth)
        context.setStrokeColor(color.cgColor)
        context.strokePath()
        paperImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        paperImageView.alpha = 1.0
        UIGraphicsEndImageContext()
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        swiped = false
        let currentPoint = touch.location(in: paper)
        drawLine(from: lastPoint, to: currentPoint)
        lastPoint = currentPoint
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            // draw a single point
            // Maybe this initial draw can happen here, and Blob takes care of the rest?
            _ = Blob(postion: lastPoint)
            drawLine(from: lastPoint, to: lastPoint)
        }
        UIGraphicsBeginImageContext(paperImageView.frame.size)
        paperImageView.image?.draw(in: paper.bounds, blendMode: .normal, alpha: 1.0)
        paperImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }

    func resetBoard() {
        paperImageView.image = nil
    }
}

extension ViewController {
    func configureViews() {
        // Heirarchy
        view.addSubview(paintBottles)
        view.addSubview(dropcloth)
        view.addSubview(paper)
        view.addSubview(paperImageView)
        // Style
        dropcloth.horizontalAnchors == view.horizontalAnchors
        dropcloth.topAnchor == view.topAnchor
        dropcloth.bottomAnchor == view.bottomAnchor - 200
        dropcloth.backgroundColor = UIColor.white

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

        paperImageView.edgeAnchors == paper.edgeAnchors
        // Finesse
    }
}
