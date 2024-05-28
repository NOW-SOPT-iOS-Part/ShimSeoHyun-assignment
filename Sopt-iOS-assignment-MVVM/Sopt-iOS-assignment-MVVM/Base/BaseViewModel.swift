//
//  BaseViewModel.swift
//  Sopt-iOS-assignment-MVVM
//
//  Created by 심서현 on 5/27/24.
//
import RxSwift
import RxRelay

protocol BaseViewModel {
    associatedtype Input
    associatedtype Output
    
    func transform(from input: Input, disposeBag: RxSwift.DisposeBag) -> Output
}
