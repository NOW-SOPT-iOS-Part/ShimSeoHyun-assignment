//
//  LoginViewModel.swift
//  Sopt-iOS-assignment-MVVM
//
//  Created by 심서현 on 5/27/24.
//

import RxSwift
import RxRelay

final class LoginViewModel: BaseViewModel {
    private var idText: String?
    private var pwText: String?
    
    struct Input {
        let idTextFieldDidChangeEvent: Observable<String?>
        let pwTextFieldDidChangeEvent: Observable<String?>
    }
    
    struct Output {
        var isLoginButtonEnabled = BehaviorRelay<Bool>(value: false)
    }
    
    func transform(from input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
                
        Observable.combineLatest(input.idTextFieldDidChangeEvent, input.pwTextFieldDidChangeEvent)
            .map { id, pw in
                return !(id?.isEmpty ?? true) && !(pw?.isEmpty ?? true)
            }
            .bind(to: output.isLoginButtonEnabled)
            .disposed(by: disposeBag)
        
        print("TransForm")
        
        return output
    }
}
