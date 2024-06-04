//
//  NSObject+.swift
//  Sopt-iOS-assignment-MVVM
//
//  Created by 심서현 on 6/4/24.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
