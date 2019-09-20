//
//  Paper.swift
//  SpinArtV1
//
//  Created by Isaak Meier on 9/16/19.
//  Copyright © 2019 Isaak Meier. All rights reserved.
//

import Foundation
import UIKit
import Anchorage

class PaperView: UIView {

    var paperImageView = UIImageView()
    var lastPoint = CGPoint.zero
    var color = UIColor.black
    var brushWidth: CGFloat = 20.0
    var swiped = false
    let paperModel = PaperView.Model()


    override init(frame: CGRect) {
        super.init(frame: frame)
        createDisplayLink()
        configureViews()
    }

    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        swiped = false
        lastPoint = touch.location(in: self)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        swiped = false
        let currentPoint = touch.location(in: self)
        paperModel.addBlob(at: currentPoint, bounds: bounds)
        drawLine(from: lastPoint, to: currentPoint)
        lastPoint = currentPoint
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            // draw a single point
            paperModel.addBlob(at: lastPoint, bounds: bounds)
            drawLine(from: lastPoint, to: lastPoint)
        }
        UIGraphicsBeginImageContext(paperImageView.frame.size)
        paperImageView.image?.draw(in: self.bounds, blendMode: .normal, alpha: 1.0)
        paperImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }

    func createDisplayLink() {
        let displayLink = CADisplayLink(target: self, selector: #selector(update))
        displayLink.add(to: .current, forMode: .default)
    }

    func drawLine(from fromPoint: CGPoint, to toPoint: CGPoint) {
        UIGraphicsBeginImageContext(self.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        paperImageView.image?.draw(in: self.bounds)
        context.move(to: fromPoint)
        context.addLine(to: toPoint)
        context.setLineCap(.round)
        context.setBlendMode(.normal)
        // print("stroke size: \(brushWidth)")
        context.setLineWidth(brushWidth)
        context.setStrokeColor(color.cgColor)
        context.strokePath()
        paperImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        paperImageView.alpha = 1.0
        UIGraphicsEndImageContext()
    }

    @objc func resetBoard() {
        paperImageView.image = nil
        paperModel.clearBlobs()
    }

    @objc func changeColor(sender: UIButton) {
        switch sender.tag {
        case 0:
            self.color = UIColor.red
        case 1:
            self.color = UIColor.blue
        case 2:
            self.color = UIColor.green
        case 3:
            self.color = UIColor.black
        default:
            self.color = UIColor.black
        }
    }

    @objc func update(displayLink: CADisplayLink) {
        paperModel.stepBlobs()
        for blob in paperModel.blobs {
            self.brushWidth = CGFloat(blob.radius)
            // self.color = blob.color
            let convertedPoint = CGPoint(x: blob.position.x + frame.height / 2, y: blob.position.y + frame.width / 2)
            drawLine(from: convertedPoint, to: convertedPoint)
        }
    }
}

extension PaperView {
    func configureViews() {
        self.addSubview(paperImageView)
        paperImageView.edgeAnchors == self.edgeAnchors
    }

    class Model {
        // With private(set), the setter is only mutable within the class in the file
        private(set) var blobs = [Blob]()
        private(set) var circleBlob = Blob(postion: PaperPoint(x: 0, y: 0))
        var first = true

        func addBlob(at point: CGPoint, bounds: CGRect) {
            let convertedPoint = PaperPoint(x: point.x - bounds.height / 2, y: point.y - bounds.width / 2)
            let bob = Blob(postion: convertedPoint)
            blobs.append(bob)
        }

        func stepBlobs() {
            var newBlobs = [Blob]()
            for blob in blobs {
                if first {
                    circleBlob = blob
                    first = false
                }
                let newInkAmount = blob.inkAmount - 1
                var newRadius = blob.radius - 0.3
                if blob.radius < 5 {
                    newRadius = 5
                }
                let newPosition = PaperPoint(x: blob.position.x + blob.position.x / 100, y: blob.position.y + blob.position.y / 100)
                if newInkAmount > 0 {
                    let newBlob = Blob(inkAmount: newInkAmount, postion: newPosition, radius: newRadius)
                    newBlobs.append(newBlob)
                } else {
                    continue
                }
            }
            first = true
            blobs = newBlobs
        }

        func stepCircleBlob() {
            // do some crazy circle math to get the next blob
            if circleBlob.position == PaperPoint(x: 0, y: 0) {
                print("right at the center")
                return
            }
        }

        func blobsLeft() -> Bool {
            return blobs.count > 0
        }

        func clearBlobs() {
            blobs = []
        }
    }
}
