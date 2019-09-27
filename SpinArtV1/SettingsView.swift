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

    weak var delegate: SettingsViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }

    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

        // delegate?.settingsView(self, didPerformAction: .color(.red))

        // action enum--
        // pass a quick self in case you have multiple settings view
        // func settingsView(_ settingView SettingsView didPerformAction action: Action)
        // enum Action {
        //  case color(color)
        // case clear
        // etc... }

        // func settingsView(_ settingsView: SettingsView, didChooseColor color: Color)
        // func settingsView(_ settingsView: SettingsView, didClear: ???)
        // func settingsViewDidClear(_ settingsView: SettingsView)
        // func settingsView(_ settingsView: SettingsView, didClear: Void)
        // self.settingsView(self, didClear: ())

        // enum Color: Int, CaseIterable {
        // case red = 1
        // case blue
        // .rawValue
        // -> .allCases

        // extension Color {
        //   var color: UIColor {
        //     switch self {
        //       case .red: return UIColor.red
        //     }
        // }

    @objc func didPerformAction(sender: UIButton) {
        switch sender.tag {
        case 1:
            delegate?.settingsView(self, didPerformAction: Action.reset)
        case 2:
            delegate?.settingsView(self, didPerformAction: Action.color(Color.red))
        case 3:
            delegate?.settingsView(self, didPerformAction: Action.color(Color.blue))
        case 4:
            delegate?.settingsView(self, didPerformAction: Action.color(Color.green))
        case 5:
            delegate?.settingsView(self, didPerformAction: Action.color(Color.black))
        default:
            print("Button not added")
        }
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
        resetButton.addTarget(self, action: #selector(didPerformAction), for: .touchUpInside)
        resetButton.tag = 1
        redButton.addTarget(self, action: #selector(didPerformAction), for: .touchUpInside)
        redButton.tag = 2
        blueButton.addTarget(self, action: #selector(didPerformAction), for: .touchUpInside)
        blueButton.tag = 3
        greenButton.addTarget(self, action: #selector(didPerformAction), for: .touchUpInside)
        greenButton.tag = 4
        blackButton.addTarget(self, action: #selector(didPerformAction), for: .touchUpInside)
        blackButton.tag = 5
        resetButton.setTitle("Reset", for: .normal)

        // Layout
        redButton.leadingAnchor == self.leadingAnchor + 20 // 50/2
        redButton.topAnchor == self.topAnchor + 50
        redButton.bottomAnchor == self.bottomAnchor - 50
        redButton.widthAnchor == self.widthAnchor / 8
        redButton.backgroundColor = .red

        blueButton.leadingAnchor == redButton.trailingAnchor + 20
        blueButton.topAnchor == self.topAnchor + 50
        blueButton.bottomAnchor == self.bottomAnchor - 50
        blueButton.widthAnchor == self.widthAnchor / 8
        blueButton.backgroundColor = .blue

        greenButton.leadingAnchor == blueButton.trailingAnchor + 20
        greenButton.topAnchor == self.topAnchor + 50
        greenButton.bottomAnchor == self.bottomAnchor - 50
        greenButton.widthAnchor == self.widthAnchor / 8
        greenButton.backgroundColor = .green

        blackButton.leadingAnchor == greenButton.trailingAnchor + 20
        blackButton.topAnchor == self.topAnchor + 50
        blackButton.bottomAnchor == self.bottomAnchor - 50
        blackButton.widthAnchor == self.widthAnchor / 8
        blackButton.backgroundColor = .black

        resetButton.leadingAnchor == blackButton.trailingAnchor + 20
        resetButton.topAnchor == self.topAnchor + 50
        resetButton.bottomAnchor == self.bottomAnchor - 50
        resetButton.widthAnchor == self.widthAnchor / 8
        resetButton.backgroundColor = .purple

    }
}
