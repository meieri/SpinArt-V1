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

}

extension SpinArtView {
    func configureViews() {
        self.addSubview(dropcloth)
        self.addSubview(paper)

        dropcloth.horizontalAnchors == self.horizontalAnchors
        dropcloth.topAnchor == self.topAnchor

        dropcloth.bottomAnchor == self.bottomAnchor - 200
        dropcloth.backgroundColor = UIColor.white

        paper.centerXAnchor == self.centerXAnchor
        paper.centerYAnchor == self.centerYAnchor - 50
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

    }
}
