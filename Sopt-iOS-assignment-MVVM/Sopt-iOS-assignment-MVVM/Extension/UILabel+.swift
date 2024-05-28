//
//  UILabel.swift
//  Sopt-iOS-assignment-MVVM
//
//  Created by 심서현 on 5/27/24.
//

import UIKit

extension UILabel {
    static func createAttributedText(for fontName: FontStyle, withText text: String = " ", color: UIColor = .black) -> NSAttributedString? {
        let letterSpacing: CGFloat
        
        switch fontName {
        case .headline1, .name1, .name2:
            letterSpacing = -0.5
        }
        
        guard let font = UIFont.pretendard(for: fontName) else {
            print("Failed to load font")
            return nil
        }
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .kern: letterSpacing,
            .foregroundColor: color
        ]
        
        return NSAttributedString(string: text, attributes: attributes)
    }
}
