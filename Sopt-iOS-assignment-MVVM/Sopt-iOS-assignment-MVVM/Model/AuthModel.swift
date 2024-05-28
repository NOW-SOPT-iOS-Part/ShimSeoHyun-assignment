//
//  AuthModel.swift
//  Sopt-iOS-assignment-MVVM
//
//  Created by 심서현 on 5/27/24.
//

import Foundation

struct ProfileModel {
    static let shared = ProfileModel()
    
    var userId: String = ""
    var nickName: String = ""
    var email: String = ""
    
    private init() { }
}
