//
//  LoginViewController.swift
//  MVVMC-Demo
//
//  Created by thoonk on 2023/01/12.
//

import UIKit
import RxSwift
import SnapKit

final class LoginViewController: BaseViewController {
    enum LoginTextfieldType: Int {
        case id = 891
        case password = 892
    }
    
    // MARK: - UI Components
    private lazy var idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.textColor = .black
        
        let bar = setKeyboardDoneButton()
        textField.inputAccessoryView = bar
        textField.clearButtonMode = .whileEditing
        textField.delegate = self
        textField.tag = LoginTextfieldType.id.rawValue
        
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.textColor = .black
        textField.isSecureTextEntry = true
        
        let bar = setKeyboardDoneButton()
        textField.inputAccessoryView = bar
        textField.clearButtonMode = .whileEditing
        textField.delegate = self
        textField.tag = LoginTextfieldType.password.rawValue

        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .black
        
        return button
    }()
    
    // MARK: - Properties
    var viewModel: LoginViewModel?
    private var bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        bind()
    }
    
    func bind() {
        guard let viewModel = self.viewModel else { return }
        let input = viewModel.input
        let output = viewModel.output
        
        
    }
    
    override func setupLayout() {
        let loginFormStackView = UIStackView(arrangedSubviews: [idTextField, passwordTextField])
        loginFormStackView.axis = .vertical
        loginFormStackView.alignment = .fill
        loginFormStackView.distribution = .equalSpacing
        loginFormStackView.spacing = 10.0
        
        [
            loginFormStackView,
            loginButton
        ].forEach { view.addSubview($0) }
        
        loginFormStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(30.0)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(loginFormStackView.snp.bottom).offset(30.0)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(150.0)
            $0.height.equalTo(60.0)
        }
    }
}

private extension LoginViewController {
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == idTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            passwordTextField.resignFirstResponder()
            checkValidation()
        }
        
        return true
    }
    
    func checkValidation() {
        guard let id = idTextField.text, !id.isEmpty else {
            setupAlertView(with: "아이디를 입력해 주세요.", handler: nil)
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            setupAlertView(with: "비밀번호를 입력해 주세요.", handler: nil)
            return
        }
    }
    
    func setKeyboardDoneButton() -> UIToolbar {
        let bar = UIToolbar()
        let leftSpace = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        let doneBtn = UIBarButtonItem(
            title: "완료",
            style: .done,
            target: self,
            action: #selector(doneButtonTapped)
        )
        bar.items = [leftSpace, doneBtn]
        bar.sizeToFit()
        return bar
    }
    
    @objc
    func doneButtonTapped(sender: Any) {
        self.view.endEditing(true)
    }
}
