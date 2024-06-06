//
//  LoginViewModel.swift
//  Sopt-iOS-assignment-MVVM
//
//  Created by 심서현 on 5/27/24.
//

import RxSwift
import RxRelay

final class LoginViewModel: BaseViewModel {
    
    private let idText = BehaviorRelay<String>(value: "")
    private let pwText = BehaviorRelay<String>(value: "")
    
    struct Input {
        let onChangeIdTextField: Observable<String?>
        let onChangePwTextField: Observable<String?>
        let onDidTabLoginButton: Observable<Void>
    }
    
    struct Output {
        var isLoginButtonEnabled = BehaviorRelay<Bool>(value: false)
        var isLogined = PublishRelay<Void>()
    }
    
    func transform(from input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        
        input.onChangeIdTextField.subscribe(onNext: { [weak self] id in
            self?.idText.accept(id ?? "")
         }).disposed(by: disposeBag)
        
        input.onChangePwTextField.subscribe(onNext: { [weak self] pw in
            self?.pwText.accept(pw ?? "")
         }).disposed(by: disposeBag)
  
        Observable.combineLatest(input.onChangeIdTextField, input.onChangePwTextField)
            .map { id, pw in
                return !(id?.isEmpty ?? true) && !(pw?.isEmpty ?? true)
            }
            .bind(to: output.isLoginButtonEnabled)
            .disposed(by: disposeBag)
        
        input.onDidTabLoginButton.subscribe(onNext: { _ in
            print("------------------- 로그인 시도 -------------------")
            print("id: \(self.idText.value)  pw: \(self.pwText.value)")
            
            ProfileModel.shared.userID.accept(self.idText.value)
            
            output.isLogined.accept(Void())
        }).disposed(by: disposeBag)
        
        return output
    }
}
