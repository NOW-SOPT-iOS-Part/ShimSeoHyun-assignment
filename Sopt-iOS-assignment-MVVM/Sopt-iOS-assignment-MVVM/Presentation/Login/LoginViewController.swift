//
//  LoginViewController.swift
//  Sopt-iOS-assignment-MVVM
//
//  Created by 심서현 on 5/27/24.
//

import UIKit

import SnapKit
import Then

import RxSwift
import RxCocoa

final class LoginViewController: BaseViewController {
    // MARK: - Property
    
    private let viewModel: LoginViewModel  = LoginViewModel()
    
    private let disposeBag = DisposeBag()
    
    // MARK: - Component
    
    let titleLabel = UILabel().then {
        $0.attributedText = UILabel.createAttributedText(for: .headline1, withText: "TVING ID 로그인", color: .white)
    }
    
    lazy var idTextField = self.createLoginTextField(placeHolder: "아이디")
    
    lazy var pwTextField = self.createLoginTextField(placeHolder: "비밀번호")
    
    lazy var loginButton = UIButton().then {
        if let attributedTitle = UILabel.createAttributedText(for: .name1, withText: "로그인하기", color: .white) {
            $0.setAttributedTitle(attributedTitle, for: .normal)
        }
        $0.layer.cornerRadius = 3
        $0.backgroundColor = .main1
        $0.layer.borderColor = UIColor.gray4.cgColor
    }
    
    // MARK: - Init
    
    // MARK: - Life Cycle
    
    // MARK: - Set UI
    
    override func setLayout() {
        view.addSubviews(titleLabel, idTextField, pwTextField, loginButton)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(50)
            $0.centerX.equalToSuperview()
        }
        
        idTextField.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.top.equalTo(titleLabel.snp.bottom).offset(31)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        pwTextField.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        loginButton.snp.makeConstraints {
            $0.height.equalTo(58)
            $0.top.equalTo(pwTextField.snp.bottom).offset(21)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    override func setStyle() {
        view.backgroundColor = .black
    }
    
    // MARK: - Helper
    
    override func bindViewModel() {
        let input = LoginViewModel.Input(
            idTextFieldDidChangeEvent: idTextField.rx.text.asObservable(),
            pwTextFieldDidChangeEvent: pwTextField.rx.text.asObservable(),
            loginButtonDidTapEvent:
                loginButton.rx.tap.asObservable()
        )
        
        let output = viewModel.transform(from: input, disposeBag: disposeBag)
        
        output.isLoginButtonEnabled
            .bind(onNext: { [weak self] isEnabled in
                self?.updateLoginButton(isEnabled)
            })
            .disposed(by: disposeBag)
        
        input.loginButtonDidTapEvent
            .subscribe(onNext: { [weak self] _ in
                self?.pushToWelcomeVC()
            })
            .disposed(by: disposeBag)
    }
    
    func updateLoginButton(_ isEnabled: Bool) {
        let backgroundColor = isEnabled ? UIColor.main1 : nil
        let borderWidth = isEnabled ? 0 : 1
        let titleColor = isEnabled ? UIColor.white : UIColor.gray2
        
        self.loginButton.backgroundColor = backgroundColor
        self.loginButton.layer.borderWidth = CGFloat(borderWidth)
        if let attributedTitle = UILabel.createAttributedText(for: .name1, withText: "로그인하기", color: titleColor) {
            self.loginButton.setAttributedTitle(attributedTitle, for: .normal)
        }
        loginButton.isEnabled = isEnabled
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = BaseViewController()
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    // MARK: - Action
     
}

// MARK: - Extension

extension LoginViewController {
    func createLoginTextField (placeHolder: String) -> UITextField {
        let textField = UITextField().then {
            $0.backgroundColor = .gray4
            
            $0.attributedPlaceholder = UILabel.createAttributedText(for: .name1, withText: placeHolder, color: .gray2)
            
            $0.typingAttributes = [
                .font: UIFont.pretendard(for: .name1) as Any,
                .kern: -0.5,
                .foregroundColor: UIColor.white
            ]
            
            $0.font = UIFont.pretendard(for: .name1)
            $0.textColor = .white
            
            $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 22, height: 0))
            $0.leftViewMode = .always
            $0.layer.cornerRadius = 3
        }
        
        return textField
    }
}
// MARK: - ___ Delegate
