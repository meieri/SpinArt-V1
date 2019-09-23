//
//  SettingsView.swift
//  SpinArtV1
//
//  Created by Isaak Meier on 9/23/19.
//  Copyright © 2019 Isaak Meier. All rights reserved.
//

import UIKit
import Anchorage
import Foundation

class SettingsView: UIView {
    let resetButton = UIButton()
    let blueButton = UIButton()
    let redButton = UIButton()
    let greenButton = UIButton()
    let blackButton = UIButton()

    var delegate: SettingsViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }

    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func resetBoard() {
        delegate?.resetBoard()
    }

    @objc func changeColor(sender: UIButton) {
        delegate?.changeColor(sender: sender)
    }

}

extension SettingsView {
    func configureViews() {
        // Heirarchy
        self.addSubview(resetButton)
        self.addSubview(redButton)
        self.addSubview(greenButton)
        self.addSubview(blueButton)
        self.addSubview(blackButton)
        // Style

        resetButton.centerXAnchor == self.centerXAnchor
        resetButton.topAnchor == self.topAnchor + 100
        resetButton.widthAnchor == self.widthAnchor / 6
        resetButton.backgroundColor = .red
        resetButton.setTitle("Reset", for: .normal)

        resetButton.addTarget(self, action: #selector(resetBoard), for: .touchUpInside)

        redButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        redButton.tag = 0
        blueButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        blueButton.tag = 1
        greenButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        greenButton.tag = 2
        blackButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        blackButton.tag = 3

        redButton.leadingAnchor == self.leadingAnchor + 10
        redButton.topAnchor == self.topAnchor + 50
        redButton.heightAnchor == 30
        redButton.widthAnchor == 75
        redButton.backgroundColor = .red

        blueButton.leadingAnchor == self.leadingAnchor + 10
        blueButton.topAnchor == redButton.bottomAnchor + 10
        blueButton.heightAnchor == 30
        blueButton.widthAnchor == 75
        blueButton.backgroundColor = .blue

        greenButton.heightAnchor == 30
        greenButton.widthAnchor == 75
        greenButton.leadingAnchor == self.leadingAnchor + 10
        greenButton.topAnchor == blueButton.bottomAnchor + 10
        greenButton.backgroundColor = .green

        blackButton.heightAnchor == 30
        blackButton.widthAnchor == 75
        blackButton.leadingAnchor == self.leadingAnchor + 10
        blackButton.topAnchor == greenButton.bottomAnchor + 10
        blackButton.backgroundColor = .black
    }
}
