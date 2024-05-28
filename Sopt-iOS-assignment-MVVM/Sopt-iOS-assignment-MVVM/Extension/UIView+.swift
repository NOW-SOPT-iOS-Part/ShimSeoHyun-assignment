//
//  UIView+.swift
//  Sopt-iOS-assignment-MVVM
//
//  Created by 심서현 on 5/27/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
}
