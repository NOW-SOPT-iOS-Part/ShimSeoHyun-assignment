//
//  HomeViewModel.swift
//  Sopt-iOS-assignment-MVVM
//
//  Created by 심서현 on 6/4/24.
//

import RxSwift
import RxRelay

final class HomeViewModel: BaseViewModel {
    struct Input {
        let data: Observable<Void>
    }
    
    struct Output {}
    
    func transform(from input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        return output
    }
        
}
