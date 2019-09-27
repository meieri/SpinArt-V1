//
//  SpinArtView.swift
//  SpinArtV1
//
//  Created by Isaak Meier on 9/23/19.
//  Copyright © 2019 Isaak Meier. All rights reserved.
//

import UIKit
import Foundation
import Anchorage

class SpinArtView: UIView {
    let paper = PaperView()
    let dropcloth = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }

    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        print("Passing all touches to the next view in the view stack")
        return true
    }
}

extension SpinArtView {
    func configureViews() {
        // Heirarchy
        self.addSubview(paper)
        self.addSubview(dropcloth)
        // Style
        dropcloth.alpha = 0

        paper.layer.shadowColor = UIColor.black.cgColor
        paper.layer.shadowOpacity = 1
        paper.layer.shadowOffset = .zero
        paper.layer.shadowRadius = 10
        paper.backgroundColor = .white

        // Layout
        dropcloth.edgeAnchors == self.edgeAnchors

        paper.centerXAnchor == self.centerXAnchor
        paper.centerYAnchor == self.centerYAnchor
        paper.widthAnchor == 300
        paper.heightAnchor == 300

        // cache shadow
        // also set shadow path
        // You never run into problems with one of anything
        // Don't make optimization changes without concrete evidence that one way is better
        paper.layer.shouldRasterize = true
        paper.layer.rasterizationScale = UIScreen.main.scale

    }
}
