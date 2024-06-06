//
//  UIFont+.swift
//  Sopt-iOS-assignment-MVVM
//
//  Created by 심서현 on 5/27/24.
//

import UIKit

extension UIFont {
    static func pretendard(for name: FontStyle) -> UIFont? {
        let size: CGFloat
        let fontName: String
        
        switch name {
        case .headline1:
            size = 23
            fontName = FontName.Medium.rawValue
        case .name1:
            size = 15
            fontName = FontName.SemiBold.rawValue
        case .name2:
            size = 14
            fontName = FontName.SemiBold.rawValue
        }
        
        return UIFont(name: fontName, size: size)
    }
}
