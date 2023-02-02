//
//  FontExtention.swift
//  BiometricUI
//
//  Created by Guru Mahan on 18/01/23.
//

import SwiftUI

enum FontWeight: String {
    case light = "Light"
    case regular = "Regular"
    case medium = "Medium"
    case semibold = "Semibold"
    case bold = "Bold"
}

extension Font {
    static func fontSFProText(ofSize: CGFloat, weight: FontWeight = .regular) -> Font {
        return Font.custom("SFProText-\(weight.rawValue)", size: ofSize)
    }
}

