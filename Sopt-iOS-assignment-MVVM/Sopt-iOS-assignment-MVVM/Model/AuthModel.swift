//
//  AuthModel.swift
//  Sopt-iOS-assignment-MVVM
//
//  Created by 심서현 on 5/27/24.
//

import Foundation

import RxSwift
import RxRelay

struct ProfileModel {
    static var shared = ProfileModel()
    
    let userID = BehaviorRelay<String>(value: "")
    var nickName: String = ""
    var email: String = ""
    
    private init() { }
}
