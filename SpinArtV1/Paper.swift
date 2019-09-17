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

    var blobModel = BlobViewModel()

    override init(frame: CGRect) {
        super.init(frame: frame)
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
        print(lastPoint)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        swiped = false
        let currentPoint = touch.location(in: self)
        drawLine(from: lastPoint, to: currentPoint)
        lastPoint = currentPoint
    }


    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            // draw a single point
            let bob = Blob(postion: lastPoint)
            blobModel.addBlob(blob: bob)
            drawLine(from: lastPoint, to: lastPoint)
        }

        UIGraphicsBeginImageContext(paperImageView.frame.size)
        paperImageView.image?.draw(in: self.bounds, blendMode: .normal, alpha: 1.0)
        paperImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
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
        context.setLineWidth(brushWidth)
        context.setStrokeColor(color.cgColor)
        context.strokePath()
        paperImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        paperImageView.alpha = 1.0
        UIGraphicsEndImageContext()
    }

    func resetBoard() {
        paperImageView.image = nil
    }
}

extension PaperView {
    func configureViews() {
        self.addSubview(paperImageView)
        paperImageView.edgeAnchors == self.edgeAnchors
    }
}
